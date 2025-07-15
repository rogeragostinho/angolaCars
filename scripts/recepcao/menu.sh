#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo ""
    echo "==== MENU RECEPÇÃO ===="
    echo "1) Registar Cliente interessado"
    echo "2) Apresentar carros disponíveis"
    echo "3) Procurar comprovativo de venda"
    echo "4) Mostrar clientes interessados"
    echo "0) Voltar"
    read -p "Escolha: " opcao

    case "$opcao" in
        1) bash $BASE_DIR/registar_cliente_interessado.sh ;;
        2) bash $BASE_DIR/../compartilhado/apresentar_carros_disponiveis.sh ;;
        3) bash $BASE_DIR/../compartilhado/procurar_comprovativo_de_venda.sh ;;
        4) bash $BASE_DIR/../compartilhado/mostrar_clientes_interessados.sh ;;
        0) exit ;;
        *) echo "Opção inválida." ;;
    esac
done

