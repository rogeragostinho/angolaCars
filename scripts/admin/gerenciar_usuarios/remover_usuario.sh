#!/bin/bash

echo "=== REMOVER USUÁRIO ==="
read -p "Nome do usuário a remover: " usuario
read -p "Tens certeza? (s/N): " confirma

if [[ "$confirma" =~ ^[sS]$ ]]; then
  sudo deluser "$usuario"
  sudo rm -rf /home/"$usuario"
  echo "🗑️ Usuário '$usuario' removido com sucesso."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
else
  echo "❌ Cancelado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
fi
