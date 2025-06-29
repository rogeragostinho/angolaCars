#!/bin/bash

HIST="/var/opt/angolacars/vendas/historico.csv"

if [ ! -s "$HIST" ]; then
  echo "❌ Nenhuma venda registrada ainda."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

read -p "Nome do cliente: " cliente

if [ -z "$cliente" ]; then
  echo "❌ O nome do cliente não pode estar vazio."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo
echo "🔍 Resultados encontrados para: $cliente"
echo "----------------------------------------"
awk -F';' -v nome="$cliente" '$1 ~ nome { printf "Cliente: %s | Carro: %s | Valor: %s Kz | Data: %s\n", $1, $2, $3, $4 }' "$HIST"

if ! grep -q "^$cliente;" "$HIST"; then
  echo "⚠️ Nenhum comprovativo encontrado para esse cliente."
fi

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
