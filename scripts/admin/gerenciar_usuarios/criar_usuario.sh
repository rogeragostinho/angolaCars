#!/bin/bash

LOG_GERAL="/var/opt/angolacars/logs/sistema.log"

logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

echo "=== CRIAR USUÁRIO ==="
read -p "Nome do novo usuário (somente letras minúsculas): " username
username=$(echo "$username" | tr '[:upper:]' '[:lower:]')

echo "Tipo de usuário:"
echo "1) Admin"
echo "2) Recepção"
echo "3) Vendas"
read -p "Escolha: " tipo

case "$tipo" in
  1) grupo="angolacars_admin" ;;
  2) grupo="angolacars_recepcao" ;;
  3) grupo="angolacars_vendas" ;;
  *) 
    echo "❌ Tipo inválido."
    read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
    exit 1 ;;
esac

sudo adduser "$username"

if [ "$grupo" == "angolacars_admin" ]; then
  sudo usermod -aG angolacars,angolacars_admin,angolacars_recepcao,angolacars_vendas "$username"
else
  sudo usermod -aG angolacars,"$grupo" "$username"
fi

if [ $? -eq 0 ]; then
  echo "✅ Usuário '$username' criado no grupo '$grupo'."
  logar "Usuário criado: $username | grupo: $grupo"
else
  echo "❌ Erro ao criar novo usuário."
fi

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
