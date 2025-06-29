#!/bin/bash

CARROS="/var/opt/angolacars/dados/carros.txt"
HIST="/var/opt/angolacars/vendas/historico.csv"
LOG="/var/opt/angolacars/vendas/logs/vendas.log"

# Mostra carros disponíveis
echo "📋 Carros disponíveis para venda:"
awk -F';' '$6 == "Disponível" { print "ID:", $1, "- Marca:", $2, "- Modelo:", $3, "- Preço:", $5 " Kz" }' "$CARROS"

echo
read -p "ID do carro a vender: " id

# Pega linha do carro
linha=$(grep "^$id;" "$CARROS")

if [ -z "$linha" ]; then
  echo "❌ Carro não encontrado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Verifica se já foi vendido
estado=$(echo "$linha" | cut -d';' -f6)
if [ "$estado" != "Disponível" ]; then
  echo "❌ Esse carro já foi vendido."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

read -p "Nome do cliente: " cliente
[ -z "$cliente" ] && echo "❌ Cliente não pode ser vazio." && read -n 1 -s -r -p "Pressione qualquer tecla para continuar..." && echo && exit 1

# Extrai dados do carro
IFS=';' read -r cid marca modelo ano preco estado <<< "$linha"

# Atualiza estado para 'Vendido'
nova_linha="$cid;$marca;$modelo;$ano;$preco;Vendido"
sed -i "s|^$cid;.*|$nova_linha|" "$CARROS"

# Registra venda
echo "$cliente;$marca $modelo;$preco;$(date)" >> "$HIST"
echo "$(date +%F_%H-%M-%S) - Venda realizada: ID $cid para $cliente." | tee -a "$LOG"

echo -e "\n✅ Venda concluída com sucesso!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
