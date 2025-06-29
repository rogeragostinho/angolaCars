#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "ID do carro a eliminar: " id

if ! grep -q "^$id;" "$ARQUIVO"; then
  echo "❌ ID não encontrado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

sed -i "/^$id;/d" "$ARQUIVO"
echo "🗑️ Carro ID $id removido com sucesso."

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
