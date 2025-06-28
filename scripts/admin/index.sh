#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[1] Criar novo usuário"

read -p "> " opcao

case $opcao in
    1) bash $BASE_DIR/menu_criar_novo_usuario.sh
    *) ;;
esac