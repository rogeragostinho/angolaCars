#!/bin/bash

PARTICAO="/dev/mmcblk1p1"
MONTAGEM="/angolacars/backup"
LOG="/var/opt/angolacars/logs/sistema.log"

logar() {
  echo "$(date +%F_%H-%M-%S) - $1" >> "$LOG"
}

echo "💽 Formatando $PARTICAO como ext4..."
sudo mkfs.ext4 "$PARTICAO"

echo "📁 Criando diretório de montagem em $MONTAGEM..."
sudo mkdir -p "$MONTAGEM"

echo "🔧 Montando $PARTICAO em $MONTAGEM..."
sudo mount "$PARTICAO" "$MONTAGEM"

if mountpoint -q "$MONTAGEM"; then
  echo "✅ Partição montada com sucesso!"
  logar "Partição $PARTICAO montada em $MONTAGEM"
else
  echo "❌ Falha ao montar partição!"
  logar "Erro ao montar $PARTICAO"
  exit 1
fi
