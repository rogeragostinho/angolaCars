#!/bin/bash

bash apresentacao

while true; do
    echo "===== MENU ANGOLACARS ====="
    echo "1 - Registar Cliente"
    echo "2 - Registar Venda"
    echo "3 - Fazer Backup"
    echo "4 - Limpar Clientes Antigos"
    echo "5 - Sincronizar com outra Filial"
    echo "6 - Sair"
    read -p "Escolha: " op

    case "$op" in
        #1) bash /angolacars/scripts/registar_cliente.sh ;;
        1) bash registar_cliente.sh ;;
        2) bash venda.sh ;;
        3) bash /angolacars/scripts/backup.sh ;;
        4) bash /angolacars/scripts/limpeza.sh ;;
        5) bash /angolacars/scripts/sincronizar_filiais.sh ;;
        6) echo "Saindo..."; exit ;;
        *) echo "Opção inválida." ;;
    esac
done
