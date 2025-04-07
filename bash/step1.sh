#!/bin/bash

# Проверка прав root
if [ "$(id -u)" -ne 0 ]; then
  echo "Этот скрипт требует root-прав. Запустите через sudo!" >&2
  exit 1
fi

# Логирование действий
LOG_FILE="/var/log/disable_security_rockylinux.log"
echo "=== $(date) ===" > "$LOG_FILE"

# 1. Отключение firewalld
echo "1. Остановка и отключение firewalld..."
systemctl stop firewalld >> "$LOG_FILE" 2>&1
systemctl disable firewalld >> "$LOG_FILE" 2>&1
echo "✅ Firewalld остановлен и отключен" | tee -a "$LOG_FILE"

# 2. Отключение SELinux (временно + перманентно)
echo "2. Отключение SELinux..."
setenforce 0 >> "$LOG_FILE" 2>&1
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config >> "$LOG_FILE" 2>&1
echo "✅ SELinux переведен в permissive mode и отключен в конфиге" | tee -a "$LOG_FILE"

# 3. Отключение swap
echo "3. Отключение swap..."
swapoff -a >> "$LOG_FILE" 2>&1
sed -i '/swap/d' /etc/fstab >> "$LOG_FILE" 2>&1
echo "✅ Swap отключен и удален из /etc/fstab" | tee -a "$LOG_FILE"

# 4. Дополнительно: отключение NetworkManager (опционально, если используется systemd-networkd)
# echo "4. Остановка NetworkManager..."
# systemctl stop NetworkManager >> "$LOG_FILE" 2>&1
# systemctl disable NetworkManager >> "$LOG_FILE" 2>&1
# echo "✅ NetworkManager отключен (если требуется)"




# Устанавливаем EPEL репозиторий (если ещё не установлен)
if ! rpm -q epel-release >/dev/null; then
    echo "Установка EPEL репозитория..."
    dnf install -y epel-release
fi

# Обновляем систему (опционально)
echo "Обновление системы..."
dnf update -y

# Устанавливаем p7zip
echo "Установка p7zip..."
dnf install -y p7zip p7zip-plugins mc vim libseccomp wget tar curl


# Проверка результатов
echo -e "\nРезультаты:" | tee -a "$LOG_FILE"
echo "- Firewalld статус: $(systemctl is-enabled firewalld 2>/dev/null || echo 'неактивен')" | tee -a "$LOG_FILE"
echo "- SELinux режим: $(getenforce)" | tee -a "$LOG_FILE"
echo "- Swap: $(swapon --show | wc -l) активных разделов" | tee -a "$LOG_FILE"

echo -e "\nГотово! Подробности в логе: $LOG_FILE"