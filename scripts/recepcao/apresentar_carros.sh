#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"

if [ ! -f "$ARQUIVO" ]; then
  echo "Nenhum carro cadastrado."
  exit 1
fi

echo "Carros disponíveis:"
echo "------------------"
awk -F';' '$6 == "Disponível" {
  printf "ID: %s | %s %s (%s) - %s Kz\n", $1, $2, $3, $4, $5
}' "$ARQUIVO"
