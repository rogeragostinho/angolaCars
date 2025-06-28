#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "Marca: " marca
read -p "Modelo: " modelo
read -p "Ano: " ano
read -p "Preço (em Kz): " preco
estado="Disponível"

# Gera ID automático
if [ -f "$ARQUIVO" ]; then
  id=$(($(tail -n 1 "$ARQUIVO" | cut -d';' -f1) + 1))
else
  id=1
fi

echo "$id;$marca;$modelo;$ano;$preco;$estado" >> "$ARQUIVO"
echo "Carro cadastrado com sucesso!"
