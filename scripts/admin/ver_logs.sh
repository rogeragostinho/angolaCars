#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOG="/var/opt/angolacars/logs/sistema.log"
alias logs="$BASE_DIR/ver_logs.sh"


# Verifica se o log existe
if [ ! -f "$LOG" ] || [ ! -s "$LOG" ]; then
  echo "❌ Nenhum log encontrado!"
  read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
  echo
  exit 1
fi

# Menu de opções
clear
echo "📂 VER LOGS DO SISTEMA"
echo "=============================="
echo "1. Ver todos os logs"
echo "2. Filtrar por data (AAAA-MM-DD)"
echo "3. Buscar palavra-chave"
echo "4. Sair"
echo "=============================="
read -p "Escolha uma opção [1-4]: " opcao

case $opcao in
  1)
    echo -e "\n📋 TODOS OS LOGS:"
    echo "---------------------------------------------"
    cat "$LOG"
    ;;
  2)
    read -p "Digite a data (AAAA-MM-DD): " data
    echo -e "\n📅 LOGS em $data:"
    echo "---------------------------------------------"
    grep "^$data" "$LOG" || echo "⚠️ Nenhum log encontrado para essa data."
    ;;
  3)
    read -p "Digite a palavra-chave: " palavra
    echo -e "\n🔍 LOGS contendo \"$palavra\":"
    echo "---------------------------------------------"
    grep -i "$palavra" "$LOG" || echo "⚠️ Nenhum log encontrado com essa palavra."
    ;;
  4)
    echo "👋 Saindo..."
    exit 0
    ;;
  *)
    echo "❌ Opção inválida!"
    ;;
esac

echo
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
