#!/bin/bash

INTERESSADOS="/var/opt/angolacars/recepcao/interessados.csv"
mkdir -p "$(dirname "$INTERESSADOS")"
LOG_GERAL="/var/opt/angolacars/logs/sistema.log"
logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG_GERAL"
}

read -p "Nome do cliente: " nome
read -p "Telefone: " telefone
read -p "Interesse (marca/modelo): " interesse

if [[ -z "$nome" || -z "$telefone" || -z "$interesse" ]]; then
  echo "❌ Nenhum campo pode ficar vazio."
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

echo "$nome;$telefone;$interesse;$(date)" >> "$INTERESSADOS"
logar "Cliente interessado registrado: $nome ($telefone) | Interesse: $interesse"
echo "✅ Cliente interessado registado com sucesso."

echo
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
