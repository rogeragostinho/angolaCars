#!/bin/bash

LOG_GERAL="/var/opt/angolacars/logs/sistema.log"
logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

echo "=== REMOVER USUÁRIO ==="
read -p "Nome do usuário a remover: " usuario

# Verifica se o usuário existe
if ! id "$usuario" &>/dev/null; then
  echo "❌ Usuário '$usuario' não existe."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  exit 1
fi

# Confirmação
read -p "Tem certeza que deseja remover '$usuario'? (s/N): " confirma
if [[ "$confirma" =~ ^[sS]$ ]]; then
  # Remove o usuário e o diretório home
  sudo deluser --remove-home "$usuario"

  # Remove o usuário dos grupos angolacars (caso esteja)
  for grupo in angolacars_admin angolacars_recepcao angolacars_vendas; do
    sudo gpasswd -d "$usuario" "$grupo" &>/dev/null
  done

  echo "✅ Usuário '$usuario' removido com sucesso."
  logar "Usuário removido: $usuario"
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
else
  echo "❌ Cancelado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
fi

