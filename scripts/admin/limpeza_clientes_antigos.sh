#!/bin/bash

ARQUIVO="/var/opt/angolacars/recepcao/interessados.csv"
TEMP="/tmp/interessados_tmp.csv"
LOG="/var/opt/angolacars/recepcao/limpeza.log"
AGORA=$(date +%s)
UM_MINUTO=$((AGORA - 60))
DATA=$(date +%F_%H-%M-%S)

echo "=== LIMPEZA DE TESTE ($DATA) ===" >> "$LOG"

# Força suporte ao formato de data em português
export LC_TIME=pt_PT.UTF-8

# Se o arquivo não existir, aborta
if [[ ! -f "$ARQUIVO" ]]; then
  echo "❌ Arquivo $ARQUIVO não encontrado!"
  exit 1
fi

# Processa cada linha do arquivo
> "$TEMP"  # limpa o arquivo temporário
while IFS=';' read -r nome tel interesse data_full; do
  # Pega a linha inteira (com a data que pode conter espaços)
  linha="$nome;$tel;$interesse;$data_full"

  timestamp=$(date -d "$data_full" +%s 2>/dev/null)

  if [[ -z "$timestamp" ]]; then
    echo "⚠️ Data inválida para $nome ($data_full)" >> "$LOG"
    continue
  fi

  if [[ "$timestamp" -ge "$UM_MINUTO" ]]; then
    echo "$linha" >> "$TEMP"
  else
    echo "🗑️ Removido: $nome ($data_full)" >> "$LOG"
  fi
done < "$ARQUIVO"

mv "$TEMP" "$ARQUIVO"
echo "✅ Limpeza de teste concluída!" >> "$LOG"

echo
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
