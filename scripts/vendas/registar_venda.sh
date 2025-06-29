#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

HIST="/var/opt/angolacars/vendas/historico.csv"
LOG="/var/opt/angolacars/vendas/logs/vendas.log"

read -p "Cliente: " cliente
read -p "Carro: " carro
read -p "Valor: " valor

# alterar aqui
[[ -z $cliente || -z $carro || -z $valor ]] && (
    echo "Campos vazios!" 
    read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
    exit 1
)

echo "$cliente;$carro;$valor;$(date)" >> "$HIST"
echo "$(date +%F_%H-%M-%S) - Venda registada." | tee -a "$LOG"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
