#!/bin/bash

CARROS="/var/opt/angolacars/dados/carros.txt"
HIST="/var/opt/angolacars/vendas/historico.csv"
LOG="/var/opt/angolacars/logs/sistema.log"
LOG_GERAL="/var/opt/angolacars/logs/sistema.log"

logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

# Verifica se há carros disponíveis para venda
if ! grep -q ";Disponível" "$CARROS" 2>/dev/null; then
  echo "❌ Nenhum carro disponível para venda."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Mostra lista de carros disponíveis
echo "📋 Carros disponíveis:"
awk -F';' '$6 == "Disponível" { printf "ID: %s | %s %s | Ano: %s | Preço: %s Kz\n", $1, $2, $3, $4, $5 }' "$CARROS"
echo

read -p "ID do carro a vender: " id

# Busca o carro pelo ID
linha=$(grep "^$id;" "$CARROS")
if [ -z "$linha" ]; then
  echo "❌ Carro não encontrado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Verifica se o carro está disponível
estado=$(echo "$linha" | cut -d';' -f6)
if [ "$estado" != "Disponível" ]; then
  echo "❌ Esse carro já foi vendido."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Solicita nome do cliente
read -p "Nome do cliente: " cliente
if [ -z "$cliente" ]; then
  echo "❌ Cliente não pode ficar vazio."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Extrai dados do carro
IFS=';' read -r cid marca modelo ano preco estado <<< "$linha"

# Atualiza estado para Vendido
nova_linha="$cid;$marca;$modelo;$ano;$preco;Vendido"
sed -i "s|^$cid;.*|$nova_linha|" "$CARROS"

# Registra venda
echo "$cliente;$marca $modelo;$preco;$(date)" >> "$HIST"
#echo "$(date +%F_%H-%M-%S) - Venda realizada: ID $cid | Cliente: $cliente | Carro: $marca $modelo" | tee -a "$LOG"
#logar "Venda realizada: ID $cid para $cliente | $marca $modelo | $preco Kz"
logar "$(date +%F_%H-%M-%S) - Venda realizada: ID $cid | Cliente: $cliente | Carro: $marca $modelo"

echo -e "\n✅ Venda concluída com sucesso!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
