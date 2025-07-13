#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"
DIR=$(dirname "$ARQUIVO")
LOG_GERAL="/var/opt/angolacars/logs/sistema.log"

# Garante que o diretório existe
mkdir -p "$DIR"

logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}


# ===== Validações com pausa =====

read -p "Marca: " marca
if [ -z "$marca" ]; then
  echo "Marca não pode ficar vazia!"
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

read -p "Modelo: " modelo
if [ -z "$modelo" ]; then
  echo "Modelo não pode ficar vazio!"
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

read -p "Ano: " ano
if [[ ! "$ano" =~ ^[0-9]{4}$ ]]; then
  echo "Ano inválido! Use um ano com 4 dígitos."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

read -p "Preço (em Kz): " preco
if [[ ! "$preco" =~ ^[0-9]+$ ]]; then
  echo "Preço inválido! Digite apenas números."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

estado="Disponível"

# Gera ID automático
if [ -s "$ARQUIVO" ]; then
  last_id=$(tail -n 1 "$ARQUIVO" | cut -d';' -f1)
  id=$((last_id + 1))
else
  id=1
fi

# Salva no arquivo
echo "$id;$marca;$modelo;$ano;$preco;$estado" >> "$ARQUIVO"
logar "Carro cadastrado: ID $id | $marca $modelo $ano | $preco Kz"
echo -e "\n✅ Carro cadastrado com sucesso! ID: $id"

# Espera tecla para sair
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
