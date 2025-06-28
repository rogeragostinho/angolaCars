#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo "========= MENU ADMIN ========="
    echo "1) Cadastrar carro"
    echo "2) Listar carros"
    echo "3) Editar carro"
    echo "4) Eliminar carro"
    echo "0) Sair"
    echo "=============================="
    read -p "Escolha uma opção: " op

    case "$op" in
    1) bash "$BASE_DIR/cadastrar_carro.sh" ;;
    2) bash "$BASE_DIR/listar_carros.sh" ;;
    3) bash "$BASE_DIR/editar_carro.sh" ;;
    4) bash "$BASE_DIR/eliminar_carro.sh" ;;
    0) echo "Saindo..." ;;
    *) echo "❌ Opção inválida." ;;
    esac
done