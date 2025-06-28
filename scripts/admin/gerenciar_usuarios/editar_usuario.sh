#!/bin/bash

echo "=== EDITAR USUÁRIO ==="
read -p "Nome do usuário: " usuario

# Verifica se o usuário existe
if ! id "$usuario" &>/dev/null; then
  echo "❌ Usuário '$usuario' não existe."
  exit 1
fi

echo "O que deseja editar?"
echo "1) Mudar grupo"
echo "2) Mudar senha"
echo "3) Mudar nome de usuário"
echo "4) Mudar diretório home"
read -p "Escolha: " op

case "$op" in
  1)
    echo "Novo grupo:"
    echo "1) admin"
    echo "2) recepcao"
    echo "3) vendas"
    read -p "Escolha: " tipo
    case "$tipo" in
      1) grupo="admin" ;;
      2) grupo="recepcao" ;;
      3) grupo="vendas" ;;
      *) echo "❌ Grupo inválido."; exit 1 ;;
    esac
    sudo usermod -G "$grupo" "$usuario"
    echo "✅ Grupo do usuário '$usuario' alterado para '$grupo'."
    ;;
  
  2)
    read -s -p "Nova senha: " senha
    echo
    echo "$usuario:$senha" | sudo chpasswd
    echo "✅ Senha alterada com sucesso."
    ;;

  3)
    read -p "Novo nome de usuário: " novo
    sudo usermod -l "$novo" "$usuario"
    echo "✅ Nome de usuário alterado para '$novo'."
    ;;
  
  4)
    read -p "Novo diretório home (ex: /home/$usuario): " novohome
    sudo usermod -d "$novohome" -m "$usuario"
    echo "✅ Diretório home alterado para '$novohome'."
    ;;

  *)
    echo "❌ Opção inválida."
    ;;
esac
