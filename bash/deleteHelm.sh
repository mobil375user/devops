#!/bin/bash

# Скрипт для полного удаления Helm (включая Tiller для Helm 2)

set -euo pipefail

# Проверка прав root
if [ "$(id -u)" -ne 0 ]; then
  echo "Ошибка: Скрипт должен запускаться от root или через sudo!" >&2
  exit 1
fi

echo "🔹 Начинаем удаление Helm..."

# 1. Удаление Helm CLI
if command -v helm &>/dev/null; then
  echo "Удаляем Helm CLI..."
  # Проверяем способ установки (dnf/yum/snap/вручную)
  if dnf list installed helm &>/dev/null; then
    dnf remove -y helm
  elif yum list installed helm &>/dev/null; then
    yum remove -y helm
  elif snap list helm &>/dev/null; then
    snap remove helm
  else
    rm -f "$(command -v helm)"
  fi
  echo "✅ Helm CLI удалён."
else
  echo "ℹ️ Helm CLI не найден в системе."
fi

# 2. Удаление конфигов и кэша
echo "Очищаем конфиги и кэш..."
rm -rf ~/.helm 2>/dev/null       # Helm 2.x
rm -rf ~/.config/helm 2>/dev/null # Helm 3.x
rm -rf ~/.cache/helm 2>/dev/null  # Кэш
echo "✅ Конфиги и кэш удалены."

# 3. Удаление Tiller (Helm 2)
if kubectl get deployment tiller-deploy -n kube-system &>/dev/null; then
  echo "Найден Tiller (Helm 2), удаляем..."
  kubectl delete deployment tiller-deploy -n kube-system
  kubectl delete serviceaccount tiller -n kube-system
  kubectl delete clusterrolebinding tiller
  echo "✅ Tiller удалён из Kubernetes."
else
  echo "ℹ️ Tiller не найден (возможно, используется Helm 3)."
fi

# Финальная проверка
if ! command -v helm &>/dev/null; then
  echo "----------------------------------------"
  echo "✅ Helm успешно удалён со всей системы!"
else
  echo "----------------------------------------"
  echo "⚠️ Что-то пошло не так. Helm всё ещё доступен." >&2
  exit 1
fi