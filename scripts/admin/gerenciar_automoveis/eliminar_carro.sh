#!/bin/bash

ARQUIVO="/var/opt/angolacars/dados/carros.txt"
LOG_GERAL="/var/opt/angolacars/logs/sistema.log"
logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

read -p "ID do carro a eliminar: " id

if ! grep -q "^$id;" "$ARQUIVO"; then
  echo "❌ ID não encontrado."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

sed -i "/^$id;/d" "$ARQUIVO"
logar "Carro eliminado: ID $id | $carro"
echo "🗑️ Carro ID $id removido com sucesso."

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
