#!/bin/bash

echo "[1] Criar novo usuário"

read -p "> " opcao

case $opcao in
    1) bash scripts/admin/menu_criar_novo_usuario.sh
    *) ;;
esac