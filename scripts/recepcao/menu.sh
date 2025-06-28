#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo ""
    echo "==== MENU RECEPÇÃO ===="
    echo "1) Registar Cliente interessado"
    echo "2) Apresentar carros disponíveis"
    echo "3) Procurar comprovativos de venda"
    echo "0) Voltar"
    read -p "Escolha: " opcao

    case "$opcao" in
        1) bash registar_cliente.sh ;;
        2) bash apresentar_carros_disponiveis.sh ;;
        3) bash procurar_comprovativo_venda.sh ;;
        0) exit ;;
        *) echo "Opção inválida." ;;
    esac
done

