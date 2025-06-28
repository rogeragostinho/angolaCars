#!/bin/bash
ARQUIVO="/var/opt/angolacars/dados/carros.txt"

# Verifica se o arquivo existe e não está vazio
if [ ! -s "$ARQUIVO" ]; then
  echo "❌ Nenhum carro cadastrado ainda."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo ""
  exit 1
fi

echo "======= LISTA DE CARROS ======="
echo "ID | Marca | Modelo | Ano | Preço (Kz) | Estado"
echo "-----------------------------------------------"

while IFS=';' read -r id marca modelo ano preco estado; do
  printf "%-2s | %-6s | %-7s | %-4s | %-10s | %-s\n" "$id" "$marca" "$modelo" "$ano" "$preco" "$estado"
done < "$ARQUIVO"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."