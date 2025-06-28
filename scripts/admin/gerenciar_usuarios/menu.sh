#/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear

# Menu criar novo usuario
echo "=== MENU GERENCIAR USUÁRIOS ==="
echo "1) Criar usuário"
echo "2) Listar usuários"
echo "3) Editar usuário"
echo "4) Eliminar usuário"
echo "0) Voltar"
read -p "Escolha o grupo (1-3): " opcao

while true; do
  case "$opcao" in
    1) criar_usuario ;;
    2) listar_usuarios ;;
    3) editar_usuario ;;
    4) eliminar_usuario
    0) exit ;;
    *) echo "Opção inválida." ;;
  esac
done