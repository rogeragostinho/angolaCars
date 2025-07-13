#/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



while true; do
  clear

  echo ""
  echo "=== MENU GERENCIAR USUÁRIOS ==="
  echo "1) Criar usuário"
  echo "2) Listar usuários"
  echo "3) Editar usuário"
  echo "4) Eliminar usuário"
  echo "0) Voltar"
  read -p "Escolha uma opcão: " opcao

  case "$opcao" in
    1) $BASE_DIR/criar_usuario.sh ;;
    2) $BASE_DIR/listar_usuarios.sh ;;
    3) $BASE_DIR/editar_usuario.sh ;;
    4) $BASE_DIR/remover_usuario.sh ;;
    0) exit ;;
    *) echo "Opção inválida." ;;
  esac
done