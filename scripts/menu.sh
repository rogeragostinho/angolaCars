#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash $BASE_DIR/apresentacao.sh

# Define permissões do usuário
IS_ADMIN=$(groups $USER | grep -q '\badmin\b' && echo "1" || echo "0")
IS_RECEPCAO=$(groups $USER | grep -q '\brecepcao\b' && echo "1" || echo "0")
IS_VENDAS=$(groups $USER | grep -q '\bvendas\b' && echo "1" || echo "0")

while true; do
  clear

  echo ""
  echo "===== MENU ANGOLACARS ====="
  echo "1) Acessar menu ADMIN"
  echo "2) Acessar menu RECEPÇÃO"
  echo "3) Acessar menu VENDAS"
  echo "0) Sair"
  echo "==========================="
  read -p "Escolha uma opção: " opcao

    case "$opcao" in
        1) bash $BASE_DIR/admin/index.sh ;;
        2) bash $BASE_DIR/recepcao/index.sh ;;
        3) bash $BASE_DIR/vendas/index.sh ;;
        0) exit ;;
        *) 
          echo "Opção inválida." 
          read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
          echo
          ;;
    esac
done


: << 'FIM case $opcao in
    1)
      if [ "$IS_ADMIN" -eq 1 ]; then
        bash /opt/angolacars/scripts/admin/menu_admin.sh
      else
        echo "🚫 Acesso negado: você não pertence ao grupo admin."
      fi
      ;;
    2)
      if [ "$IS_RECEPCAO" -eq 1 ]; then
        bash /opt/angolacars/scripts/recepcao/menu_recepcao.sh
      else
        echo "🚫 Acesso negado: você não pertence ao grupo recepcao."
      fi
      ;;
    3)
      if [ "$IS_VENDAS" -eq 1 ]; then
        bash /opt/angolacars/scripts/vendas/menu_vendas.sh
      else
        echo "🚫 Acesso negado: você não pertence ao grupo vendas."
      fi
      ;;
    4) exit ;;
    *) echo "Opção inválida" ;;
  esac

  echo ""
done

