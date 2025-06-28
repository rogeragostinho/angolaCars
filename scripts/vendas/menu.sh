#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear

while true; do
    echo "==== MENU VENDAS ===="
    echo "1) Registar venda de carro"
    echo "2) Gerar relatório de venda"
    echo "3) Ver carros vendidos"
    echo "0) Voltar"
    read -p "Escolha: " opcao

    case "$opcao" in
        1) bash registar_venda_automovel.sh ;;
        2) bash gerar_relatorio_venda.sh ;;
        3) bash ver_carros_vendidos.sh ;;
        0) exit ;;
        *) echo "Opção inválida." ;;
    esac
done

