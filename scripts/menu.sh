#!/bin/bash

bash apresentacao.sh

clear

while true; do
  echo ""
  echo "===== MENU ANGOLACARS ====="
  echo "1. Administrador"
  echo "2. Atendimento"
  echo "0. Sair"
  echo "==========================="
  read -p "Escolha uma opção: " opcao

  #echo "1 - Registar Cliente"
  #echo "2 - Registar Venda"
  #echo "3 - Fazer Backup"
  #echo "4 - Limpar Clientes Antigos"
  #echo "5 - Sincronizar com outra Filial"

    case "$opcao" in
        1) bash scripts/admin/index.sh ;;
        2) bash scripts/recepcao/index.sh ;;
        3) bash scripts/vendas/index.sh ;;
        0) echo "Saindo..."; exit ;;
        *) echo "Opção inválida." ;;
    esac
done
