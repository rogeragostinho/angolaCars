#!/bin/bash

DIR="../recepcao/clientes"
LOG="../recepcao/logs/clientes.log"

read -p "Nome: " nome
read -p "Telefone: " telefone
read -p "Carro: " carro

if [[ -z $nome || -z $telefone || -z $carro ]]; then
	echo "Campos vazios!"
	exit 1
fi

ARQ="$DIR/$(echo $nome | tr ' ' _)_$(date +%F_%H-%M-%S).txt"
echo -e "Nome: $nome\nTelefone: $tel\nCarro: $carro\nData: $(date)" > "$ARQ"
echo "$(date +%F_%H-%M-%S) - Cliente registado com sucesso!" | tee -a "$LOG"