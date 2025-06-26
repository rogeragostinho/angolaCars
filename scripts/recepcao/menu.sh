#!/bin/bash

clear

while true; do
    echo "==== MENU RECEPÇÃO ===="
    echo "1 - Registar Cliente"
    echo "2 - Voltar"
    read -p "Escolha: " opcao

    case "$opcao" in
        1) bash registar_cliente.sh ;;
        2) bash ../menu.sh ;;
        *) echo "Opção inválida." ;;
    esac
done

