#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "ID do carro a editar: " id

linha=$(grep "^$id;" "$ARQUIVO")

if [ -z "$linha" ]; then
  echo "❌ ID não encontrado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

IFS=';' read -r _id marca modelo ano preco estado <<< "$linha"

read -p "Nova marca ($marca): " nova_marca
read -p "Novo modelo ($modelo): " novo_modelo
read -p "Novo ano ($ano): " novo_ano
read -p "Novo preço ($preco): " novo_preco

nova_marca=${nova_marca:-$marca}
novo_modelo=${novo_modelo:-$modelo}
novo_ano=${novo_ano:-$ano}
novo_preco=${novo_preco:-$preco}

nova_linha="$id;$nova_marca;$novo_modelo;$novo_ano;$novo_preco;$estado"

# Atualiza o arquivo substituindo a linha inteira do ID
sed -i "s|^$id;.*|$nova_linha|" "$ARQUIVO"

echo -e "\n✅ Carro atualizado com sucesso."

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
