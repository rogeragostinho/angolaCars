#!/bin/bash

echo "=== LISTAR USUÁRIOS ==="
echo "- Admin:"
getent group angolacars_admin | cut -d: -f4 | tr ',' '\n'
echo "- Recepção:"
getent group angolacars_recepcao | cut -d: -f4 | tr ',' '\n'
echo "- Vendas:"
getent group angolacars_vendas | cut -d: -f4 | tr ',' '\n'
