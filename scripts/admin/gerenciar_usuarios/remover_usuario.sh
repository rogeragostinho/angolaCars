#!/bin/bash

echo "=== REMOVER USUÁRIO ==="
read -p "Nome do usuário a remover: " usuario
read -p "Tens certeza? (s/N): " confirma

if [[ "$confirma" =~ ^[sS]$ ]]; then
  sudo deluser "$usuario"
  sudo rm -rf /home/"$usuario"
  echo "🗑️ Usuário '$usuario' removido com sucesso."
else
  echo "❌ Cancelado."
fi
