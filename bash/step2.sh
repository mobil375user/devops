#!/bin/bash
# Containerd Binary Installer for Rocky Linux
# Version: 1.0

# Проверка root-прав
if [ "$(id -u)" -ne 0 ]; then
  echo "Ошибка: скрипт должен запускаться от root" >&2
  exit 1
fi

# Установка runc
# Установка зависимостей (минимальный набор)
dnf install -y libseccomp wget tar curl

# Загрузка и установка бинарного файла runc
echo "=== Установка runc ==="
RUNC_VERSION="1.2.6"
wget -q --show-progress https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.amd64 -O /usr/local/sbin/runc
chmod +x /usr/local/sbin/runc

# Создание симлинка для совместимости
ln -sf /usr/local/sbin/runc /usr/bin/runc

# Проверка установки
echo "Проверка версии:"
runc --version


# Установка ContainerD
# Параметры
CONTAINERD_VERSION="2.0.4"
CONTAINERD_URL="https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-amd64.tar.gz"
CNI_PLUGINS_VERSION="1.6.2"
CNI_PLUGINS_URL="https://github.com/containernetworking/plugins/releases/download/v${CNI_PLUGINS_VERSION}/cni-plugins-linux-amd64-v${CNI_PLUGINS_VERSION}.tgz"
INSTALL_DIR="/opt/containerd"
BIN_DIR="/usr/local/bin"

# Создание директорий
mkdir -p ${INSTALL_DIR} ${BIN_DIR}

# Установка зависимостей
#echo "Установка зависимостей..."
#dnf install -y tar curl

# Загрузка и распаковка containerd
echo "Загрузка containerd ${CONTAINERD_VERSION}..."
curl -L ${CONTAINERD_URL} | tar Cxz ${INSTALL_DIR}

# Загрузка CNI плагинов
#echo "Загрузка CNI плагинов..."
#mkdir -p /opt/cni/bin
#curl -L ${CNI_PLUGINS_URL} | tar Cxz /opt/cni/bin

# Создание симлинков
echo "Создание симлинков..."
ln -sf ${INSTALL_DIR}/bin/* ${BIN_DIR}/

# Создание systemd unit файла
echo "Создание systemd службы..."
cat > /etc/systemd/system/containerd.service <<EOF
[Unit]
Description=containerd container runtime
Documentation=https://containerd.io
After=network.target local-fs.target

[Service]
ExecStartPre=-/sbin/modprobe overlay
ExecStart=/usr/local/bin/containerd
Restart=always
RestartSec=5
Delegate=yes
KillMode=process
OOMScoreAdjust=-999
LimitNOFILE=1048576
LimitNPROC=infinity
LimitCORE=infinity

[Install]
WantedBy=multi-user.target
EOF

# Настройка конфигурации
echo "Настройка конфигурации..."
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml


# Проверка существования нужной секции
if ! grep -q "\[plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.runc.options\]" "/etc/containerd/config.toml"; then
  echo "Ошибка: Не найдена секция runtime в конфигурации!" >&2
  echo "Проверьте версию containerd (требуется 1.4+)" >&2
fi

# Добавление параметра если отсутствует
if grep -q "SystemdCgroup = true" "/etc/containerd/config.toml"; then
  echo "Параметр SystemdCgroup уже настроен"
else
  echo "Добавляем поддержку systemd cgroups..."
  sed -i "/\[plugins.'io\.containerd\.cri\.v1\.runtime'\.containerd\.runtimes\.runc\.options\]/a \  SystemdCgroup = true" "/etc/containerd/config.toml"
fi


#sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# Запуск службы
echo "Запуск containerd..."
systemctl daemon-reload
systemctl enable --now containerd

# Проверка установки
echo "Проверка установки..."
systemctl status containerd --no-pager
containerd --version

echo "Установка containerd завершена успешно!"