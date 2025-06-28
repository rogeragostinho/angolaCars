#!/bin/bash
ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "ID do carro a eliminar: " id
grep -q "^$id;" "$ARQUIVO" || { echo "❌ ID não encontrado."; exit 1; }

sed -i "/^$id;/d" "$ARQUIVO"
echo "🗑️ Carro ID $id removido com sucesso."
