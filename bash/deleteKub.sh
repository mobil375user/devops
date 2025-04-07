#!/bin/bash
# Kubernetes Cluster Cleanup Script
# For Rocky Linux/CentOS/RHEL

echo "=== Полная очистка Kubernetes ==="

# 1. Reset kubeadm
sudo kubeadm reset --force

# 2. Remove configs
rm -rf $HOME/.kube
sudo rm -rf /etc/cni /etc/kubernetes /var/lib/kubelet /var/lib/etcd

# 3. Clean network
sudo ip link delete cni0 2>/dev/null
sudo ip link delete flannel.1 2>/dev/null
sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X

# 4. Remove packages
sudo dnf remove -y kubeadm kubelet kubectl containerd.io cri-o

# 5. Clean container data
sudo rm -rf /var/lib/containerd /var/lib/docker

echo "=== Очистка завершена! ==="