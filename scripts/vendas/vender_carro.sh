#!/bin/bash
ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "ID do carro a marcar como vendido: " id
grep -q "^$id;" "$ARQUIVO" || { echo "❌ ID não encontrado."; exit 1; }

sed -i "/^$id;/s/Disponível/Vendido/" "$ARQUIVO"
echo "✅ Carro ID $id marcado como VENDIDO."
