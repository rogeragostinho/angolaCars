#!/bin/bash
HIST="../vendas/historico.csv"
LOG="../vendas/logs/vendas.log"

read -p "Cliente: " cliente
read -p "Carro: " carro
read -p "Valor: " valor

# alterar aqui
[[ -z $cliente || -z $carro || -z $valor ]] && echo "Campos vazios!" && exit 1

echo "$cliente;$carro;$valor;$(date)" >> "$HIST"
echo "$(date +%F_%H-%M-%S) - Venda registada." | tee -a "$LOG"
