#!/bin/bash

ORIGEM="/var/opt/angolacars"
DESTINO="/angolacars/backup"
DATA=$(date +%F_%H-%M-%S)
ARQUIVO="angolacars_backup_$DATA.tar.gz"
LOG="/var/opt/angolacars/logs/sistema.log"

logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG"
}

if ! mountpoint -q "$DESTINO"; then
  echo "❌ A partição de backup não está montada!"
  logar "Backup falhou - partição não montada"
  exit 1
fi

echo "📦 Fazendo backup de $ORIGEM para $DESTINO/$ARQUIVO..."
sudo tar -czf "$DESTINO/$ARQUIVO" "$ORIGEM"

if [ $? -eq 0 ]; then
  echo "✅ Backup criado com sucesso!"
  logar "Backup feito: $DESTINO/$ARQUIVO"
else
  echo "❌ Erro ao criar backup!"
  logar "Erro ao criar $ARQUIVO"
fi

echo
read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
echo
