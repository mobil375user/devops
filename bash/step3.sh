#!/bin/bash
# Kubernetes with Containerd Installer for Rocky Linux
# Version: 2.0



# ====== Часть 3: Установка Kubernetes ======
echo "===== Установка Kubernetes ====="

# Добавление репозитория Kubernetes
cat <<EOF | tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
EOF


# Установка компонентов
dnf install -y kubelet kubeadm kubectl --disableexcludes=kubernetes


# Настройка сетевого моста
cat <<EOF | tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

# Sysctl параметры
cat <<EOF | tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sysctl --system


# 5. Включение и запуск сервисов
echo "🔹 Запускаем сервисы..."
systemctl enable --now containerd



# Настройка kubelet
#echo 'KUBELET_EXTRA_ARGS="--cgroup-driver=systemd --container-runtime=remote --container-runtime-endpoint=unix:///run/containerd/containerd.sock"' > /etc/sysconfig/kubelet

# Запуск kubelet
systemctl enable --now kubelet


#sudo tee /etc/crictl.yaml <<EOF
#runtime-endpoint: unix:///run/containerd/containerd.sock
#image-endpoint: unix:///run/containerd/containerd.sock
#timeout: 10
#debug: false
#EOF



# ====== Часть 4: Инициализация кластера ======
echo "===== Инициализация кластера ====="

# Инициализация (раскомментируйте при необходимости)
# kubeadm init --pod-network-cidr=10.244.0.0/16

# Получение IP сервера
IP=$(hostname -I | awk '{print $1}')
HOSTNAME=$(hostname)

# Инициализация control-plane
kubeadm init  --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$IP --control-plane-endpoint=$IP --apiserver-cert-extra-sans="127.0.0.1,localhost,$IP,$HOSTNAME" --upload-certs --cri-socket=unix:///run/containerd/containerd.sock

# Настройка kubectl для пользователя
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# Установка сетевого плагина (Flannel)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# --- Проверка ---
echo "=== Проверка установки ==="
kubectl get nodes
kubectl get pods -A


# --- Автодополнение
sudo apt-get install bash-completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc
source ~/.bashrc

# Проверка
echo -e "\nПроверьте статус сервисов:"
echo "  systemctl status containerd kubelet"
echo "Проверьте версии:"
echo "  containerd --version"
echo "  kubelet --version"