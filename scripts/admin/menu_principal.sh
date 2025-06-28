#/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear

# Menu criar novo usuario
echo "=== MENU ADMINISTRADOR ==="
echo "1) Gerenciar usuários"
echo "2) Gerenciar automóveis"
echo "3) Ver logs do sistema"
echo "0) Voltar"
read -p "Escolha o grupo (1-3): " opcao

while true; do
  case "$opcao" in
    1) criar_admin ;;
    2) criar_recepcao ;;
    3) criar_vendas ;;
    0) exit ;;
    *) echo "Opção inválida." ;;
  esac
done