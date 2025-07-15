#!/bin/bash

CARROS="/var/opt/angolacars/dados/carros.txt"

# Verifica se há carros vendidos
if ! grep -q ";Vendido" "$CARROS" 2>/dev/null; then
  echo "❌ Nenhum carro vendido até agora."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo "🚗 CARROS VENDIDOS"
echo "---------------------------"
printf "%-5s | %-10s | %-10s | %-6s | %-10s\n" "ID" "Marca" "Modelo" "Ano" "Preço (Kz)"
echo "---------------------------"

# Mostra os vendidos
awk -F';' '$6 == "Vendido" { printf "%-5s | %-10s | %-10s | %-6s | %-10s\n", $1, $2, $3, $4, $5 }' "$CARROS"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
