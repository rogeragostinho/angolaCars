#!/bin/bash

INTERESSADOS="/var/opt/angolacars/recepcao/interessados.csv"

if [ ! -s "$INTERESSADOS" ]; then
  echo "❌ Nenhum cliente interessado registado ainda."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo "📋 CLIENTES INTERESSADOS"
echo "------------------------------------------------------------"
printf "%-20s | %-15s | %-25s | %-20s\n" "Nome" "Telefone" "Interesse" "Data"
echo "------------------------------------------------------------"

awk -F';' '{ printf "%-20s | %-15s | %-25s | %-20s\n", $1, $2, $3, $4 }' "$INTERESSADOS"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
