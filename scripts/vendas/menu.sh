#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo ""
    echo "==== MENU VENDAS ===="
    echo "1) Registar venda de carro"
    echo "2) Gerar relatório de venda"
    echo "3) Ver carros vendidos"
    echo "4) Mostrar clientes interessados"
    echo "0) Voltar"
    read -p "Escolha: " opcao

    case "$opcao" in
        1) bash $BASE_DIR/registar_venda.sh ;;
        2) bash $BASE_DIR/gerar_relatorio_vendas.sh ;;
        3) bash $BASE_DIR/ver_carros_vendidos.sh ;;
        4) bash $BASE_DIR/../compartilhado/mostrar_clientes_interessados.sh ;;
        0) exit ;;
        *) echo "Opção inválida." ;;
    esac
done

