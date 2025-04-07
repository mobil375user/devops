#!/bin/bash
# Helm Binary Installer
# For Linux systems
# Version: 3.0

[ "$(id -u)" -ne 0 ] && { echo "Требуется запуск от root"; exit 1; }

# --- Установка зависимостей ---
echo "=== Установка зависимостей ==="
dnf install -y wget tar gzip || apt-get install -y wget tar gzip

# --- Определение последней версии Helm ---
echo "=== Получение информации о последней версии ==="
HELM_VERSION=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep 'tag_name' | cut -d\" -f4 | sed 's/v//')
HELM_URL="https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz"

# --- Загрузка и установка Helm ---
echo "=== Установка Helm ${HELM_VERSION} ==="
cd /tmp
wget -q --show-progress "$HELM_URL" -O helm.tar.gz
tar -xzf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64 helm.tar.gz

# --- Настройка завершения (completion) ---
echo "=== Настройка автодополнения ==="
helm completion bash > /etc/bash_completion.d/helm
source /etc/bash_completion.d/helm

# --- Создание конфигурационной директории ---
echo "=== Настройка конфигурации ==="
mkdir -p /root/.helm

# --- Проверка установки ---
echo "=== Проверка установки ==="
helm version --short || { echo "Ошибка установки Helm"; exit 1; }

# --- Инициализация Helm (если есть Kubernetes) ---
if command -v kubectl &> /dev/null; then
  echo "=== Инициализация Helm в Kubernetes ==="
  helm repo add stable https://charts.helm.sh/stable
  helm repo add bitnami https://raw.githubusercontent.com/bitnami/charts/index/bitnami/
  helm repo add jetstack https://charts.jetstack.io          # cert-manager
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm repo update
fi

echo -e "\n\033[1;32mHelm ${HELM_VERSION} успешно установлен!\033[0m"
echo "Доступные команды:"
echo "  helm version       # Проверка версии"
echo "  helm repo list     # Список репозиториев"
echo "  helm search repo   # Поиск чартов"
echo "  helm install       # Установка чарта"