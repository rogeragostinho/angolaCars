#!/bin/bash

clear

echo "=== LISTAR USUÁRIOS DO ANGOLACARS ==="

# Lista os grupos corretos
grupos=("angolacars_admin" "angolacars_recepcao" "angolacars_vendas")

for grupo in "${grupos[@]}"; do
  echo "- Grupo: ${grupo#angolacars_}"

  entrada=$(getent group "$grupo")

  if [ -z "$entrada" ]; then
    echo "  ⚠️  Grupo '$grupo' não encontrado."
    continue
  fi

  membros=$(echo "$entrada" | cut -d: -f4)

  if [ -z "$membros" ]; then
    echo "  (Sem usuários no grupo)"
  else
    echo "$membros" | tr ',' '\n' | sed 's/^/  - /'
  fi
done

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
