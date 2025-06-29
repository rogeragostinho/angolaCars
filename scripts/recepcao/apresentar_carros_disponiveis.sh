#!/bin/bash

CARROS="/var/opt/angolacars/dados/carros.txt"

if ! grep -q ";Disponível" "$CARROS" 2>/dev/null; then
  echo "❌ Nenhum carro disponível no momento."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo "📋 CARROS DISPONÍVEIS"
echo "-------------------------------"
printf "%-5s | %-10s | %-10s | %-6s | %-10s\n" "ID" "Marca" "Modelo" "Ano" "Preço (Kz)"
echo "-------------------------------"

awk -F';' '$6 == "Disponível" { printf "%-5s | %-10s | %-10s | %-6s | %-10s\n", $1, $2, $3, $4, $5 }' "$CARROS"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
