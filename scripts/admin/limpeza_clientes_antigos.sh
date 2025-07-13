#!/bin/bash

#!/bin/bash

ARQUIVO="/var/opt/angolacars/recepcao/clientes_interessados.csv"
TEMP="/tmp/clientes_tmp.csv"
LOG="/var/opt/angolacars/recepcao/limpeza.log"
DATA=$(date +%F_%H-%M-%S)

echo "=== LIMPEZA DE TESTE ($DATA) ===" >> "$LOG"

# Tempo atual e limite de 1 minuto atrás
AGORA=$(date +%s)

# 6 meses
#LIMITE=$(date -d '6 months ago' +%s)

#1 minuto
UM_MINUTO=$((AGORA - 60))

# Garante que o date entenda português
export LC_TIME=pt_PT.UTF-8

# Cabeçalho (se houver)
head -n 1 "$ARQUIVO" > "$TEMP"

# Processa cada linha
tail -n +2 "$ARQUIVO" | while IFS=';' read -r nome tel carro data; do
  # Pega a linha completa (coluna 4 pode conter espaços)
  linha="$nome;$tel;$carro;$data"
  timestamp=$(date -d "$data" +%s 2>/dev/null)

  if [[ -z "$timestamp" ]]; then
    echo "⚠️ Data inválida para $nome ($data)" >> "$LOG"
    continue
  fi

#6 meses
#if [[ "$timestamp" -ge "$LIMITE" ]]; then

  if [[ "$timestamp" -ge "$UM_MINUTO" ]]; then
    echo "$linha" >> "$TEMP"
  else
    echo "Removido: $nome ($data)" >> "$LOG"
  fi
done

mv "$TEMP" "$ARQUIVO"
echo "✅ Limpeza de teste concluída!" >> "$LOG"




# 6 meses :




: << '
#!/bin/bash

ARQUIVO="/var/opt/angolacars/recepcao/clientes_interessados.csv"
TEMP="/tmp/clientes_tmp.csv"
LOG="/var/opt/angolacars/recepcao/limpeza.log"
DATA=$(date +%F_%H-%M-%S)

echo "=== LIMPEZA DE CLIENTES INTERESSADOS ($DATA) ===" >> "$LOG"

# Mantém o cabeçalho
head -n 1 "$ARQUIVO" > "$TEMP"

# Remove linhas com data acima de 6 meses
tail -n +2 "$ARQUIVO" | while IFS=';' read -r nome tel carro data; do
  if [[ "$(date -d "$data" +%s)" -ge "$(date -d '6 months ago' +%s)" ]]; then
    echo "$nome;$tel;$carro;$data" >> "$TEMP"
  else
    echo "Removido: $nome ($data)" >> "$LOG"
  fi
done

# Substitui o arquivo original
mv "$TEMP" "$ARQUIVO"

echo "✅ Limpeza concluída!" >> "$LOG"
