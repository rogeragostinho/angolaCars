#!/bin/bash

# Menu criar novo usuario
echo "=== Criar Novo Usuário ==="
echo "1) Admin"
echo "2) Recepção"
echo "3) Vendas"
read -p "Escolha o grupo (1-3): " opcao

case $opcao in
  1) criar_admin ;;
  2) criar_recepcao ;;
  3) criar_vendas ;;
  *) echo "Opção inválida." ;;
esac
