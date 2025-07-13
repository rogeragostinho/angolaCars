#/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
  clear
  echo ""
  echo "=== MENU ADMINISTRADOR ==="
  echo "1) Gerenciar usuários"
  echo "2) Gerenciar automóveis"
  echo "3) Ver logs do sistema"
  echo "4) Fazer backup"
  #echo "5) Limpar clientes interessados (6+ meses)"
  echo "5) Limpar clientes interessados (1+ min)"
  echo "0) Voltar"
  read -p "Escolha uma opção: " opcao

  case "$opcao" in
    1) $BASE_DIR/gerenciar_usuarios/index.sh ;;
    2) $BASE_DIR/gerenciar_automoveis/index.sh ;;
    3) $BASE_DIR/ver_logs.sh ;;
    4) $BASE_DIR/executar_backup.sh ;;
    5) $BASE_DIR/limpeza_clientes_antigos.sh ;;
    0) exit ;;
    *) echo "Opção inválida." ;;
  esac
done