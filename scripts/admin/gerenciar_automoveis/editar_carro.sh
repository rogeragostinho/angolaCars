#!/bin/bash
ARQUIVO="/var/opt/angolacars/dados/carros.txt"

read -p "ID do carro a editar: " id
linha=$(grep "^$id;" "$ARQUIVO")
[ -z "$linha" ] && echo "❌ ID não encontrado." && exit 1

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
sed -i "s|^$id;.*|$nova_linha|" "$ARQUIVO"

echo "✅ Carro atualizado com sucesso."
