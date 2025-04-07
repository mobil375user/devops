#!/bin/bash
# Скрипт для удаления контейнера (Docker/containerd), установленного вручную

set -euo pipefail

# Проверка прав root
if [ "$(id -u)" -ne 0 ]; then
  echo "Ошибка: Скрипт должен запускаться от root или через sudo!" >&2
  exit 1
fi

# Определяем тип контейнера (docker/containerd)
CONTAINER_TYPE=""
if command -v docker &>/dev/null; then
  CONTAINER_TYPE="docker"
elif command -v containerd &>/dev/null; then
  CONTAINER_TYPE="containerd"
else
  echo "Ошибка: Не найден ни Docker, ни containerd!" >&2
  exit 1
fi

echo "🔹 Удаляем $CONTAINER_TYPE..."

# 1. Остановка всех контейнеров и сервиса
if [ "$CONTAINER_TYPE" = "docker" ]; then
  echo "Останавливаем Docker..."
  docker kill $(docker ps -q) 2>/dev/null || true
  systemctl stop docker docker.socket containerd
else
  echo "Останавливаем containerd..."
  systemctl stop containerd
fi

# 2. Удаление бинарников
echo "Удаляем бинарные файлы..."
BIN_PATHS=(
  "/usr/local/bin/docker"
  "/usr/local/bin/containerd"
  "/usr/local/bin/runc"
  "/usr/local/bin/ctr"
  "/usr/local/bin/dockerd"
  "/usr/local/bin/docker-compose"
)

for bin in "${BIN_PATHS[@]}"; do
  if [ -f "$bin" ]; then
    rm -fv "$bin"
  fi
done

# 3. Удаление конфигурационных файлов
echo "Удаляем конфиги и данные..."
CONFIG_PATHS=(
  "/etc/docker"
  "/var/lib/docker"
  "/etc/containerd"
  "/var/lib/containerd"
  "~/.docker"
)

for path in "${CONFIG_PATHS[@]}"; do
  if [ -e "$path" ]; then
    rm -rfv "$path"
  fi
done

# 4. Удаление systemd unit-файлов
echo "Удаляем service-файлы..."
SERVICE_FILES=(
  "/etc/systemd/system/docker.service"
  "/etc/systemd/system/docker.socket"
  "/etc/systemd/system/containerd.service"
)

for service in "${SERVICE_FILES[@]}"; do
  if [ -f "$service" ]; then
    rm -fv "$service"
  fi
done

systemctl daemon-reload

# 5. Удаление пользовательских групп
echo "Удаляем группу docker..."
groupdel docker 2>/dev/null || true

echo "✅ $CONTAINER_TYPE полностью удалён!"