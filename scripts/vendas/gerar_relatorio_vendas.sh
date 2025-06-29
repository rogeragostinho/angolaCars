#!/bin/bash

HIST="/var/opt/angolacars/vendas/historico.csv"
logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

# Verifica se há histórico
if [ ! -s "$HIST" ]; then
  echo "❌ Nenhuma venda registrada ainda."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo "📊 RELATÓRIO DE VENDAS"
echo "---------------------------"
printf "%-20s | %-25s | %-10s | %-20s\n" "Cliente" "Carro" "Valor (Kz)" "Data"
echo "---------------------------"

# Mostra as vendas formatadas
awk -F';' '{ printf "%-20s | %-25s | %-10s | %-20s\n", $1, $2, $3, $4 }' "$HIST"

echo "---------------------------"
echo "Total de vendas: $(wc -l < "$HIST")"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
