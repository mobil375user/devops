#!/bin/bash

# Проверка установки kubectl
if ! command -v kubectl &> /dev/null; then
  echo "Ошибка: kubectl не установлен!"
  exit 1
fi

# Настройка автодополнения
echo "Настройка автодополнения kubectl для Bash..."

# Проверяем, есть ли уже автодополнение
if grep -q "kubectl completion bash" ~/.bashrc; then
  echo "Автодополнение уже настроено в ~/.bashrc"
else
  echo "source <(kubectl completion bash)" >> ~/.bashrc
  echo "Автодополнение добавлено в ~/.bashrc"
fi

# Применяем изменения
source ~/.bashrc
echo "Готово! Попробуйте ввести 'kubectl get <TAB>'"