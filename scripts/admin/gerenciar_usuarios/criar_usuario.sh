#!/bin/bash

echo "=== CRIAR USUÁRIO ==="
read -p "Nome do novo usuário: " username

echo "Tipo de usuário:"
echo "1) Admin"
echo "2) Recepção"
echo "3) Vendas"
read -p "Escolha: " tipo

case "$tipo" in
  1) grupo="admin" ;;
  2) grupo="recepcao" ;;
  3) grupo="vendas" ;;
  *) 
    echo "❌ Tipo inválido."
    read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
    exit 1 ;;
esac

sudo adduser "$username"
sudo usermod -aG "$grupo" "$username"
echo "✅ Usuário '$username' criado no grupo '$grupo'."
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
