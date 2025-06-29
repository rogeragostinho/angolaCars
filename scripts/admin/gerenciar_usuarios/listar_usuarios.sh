#!/bin/bash

echo "=== LISTAR USUÁRIOS DO ANGOLACARS ==="

for grupo in angolacars_admin angolacars_recepcao angolacars_vendas; do
  echo "- Grupo: ${grupo#angolacars_} →"
  membros=$(getent group "$grupo" | cut -d: -f4)

  if [ -z "$membros" ]; then
    echo "  (Nenhum usuário no grupo)"
  else
    echo "  $membros" | tr ',' '\n' | sed 's/^/  - /'
  fi
done
