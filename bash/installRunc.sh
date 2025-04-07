#!/bin/bash
# Установка runc без компиляции
# Для Rocky Linux/CentOS/RHEL

# Проверка root-прав
[ "$(id -u)" -ne 0 ] && { echo "Требуются root-права"; exit 1; }

# Установка зависимостей (минимальный набор)
dnf install -y libseccomp wget

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

echo -e "\n\033[1;32mrunc успешно установлен!\033[0m"
echo "Путь к исполняемому файлу: $(which runc)"