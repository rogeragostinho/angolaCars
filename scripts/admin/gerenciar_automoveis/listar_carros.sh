#!/bin/bash
ARQUIVO="/var/opt/angolacars/dados/carros.txt"

[ ! -f "$ARQUIVO" ] && echo "❌ Nenhum carro cadastrado." && exit 1

echo "🚗 Lista de Carros:"
awk -F';' '{ printf "ID: %s | %s %s (%s) - %s Kz [%s]\n", $1, $2, $3, $4, $5, $6 }' "$ARQUIVO"
