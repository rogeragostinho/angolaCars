#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo chown -R :angolacars_admin $BASE_DIR/../admin
sudo chmod -R 770 $BASE_DIR/../admin

sudo chown -R :angolacars_recepcao $BASE_DIR/../recepcao
sudo chmod -R 770 $BASE_DIR/../recepcao

sudo chown -R :angolacars_vendas $BASE_DIR/../vendas
sudo chmod -R 770 $BASE_DIR/../vendas

sudo chown -R :angolacars $BASE_DIR/../compartilhado
sudo chmod -R 770 $BASE_DIR/../compartilhado

sudo chown -R :angolacars /var/opt/angolacars
sudo chmod -R 777 /var/opt/angolacars
#sudo chmod o+rx /var /var/opt /var/opt/angolacars /var/opt/angolacars/dados
#sudo chmod 777 /var/opt/angolacars
#sudo chmod g+s /var/opt/angolacars

sudo chown -R :angolacars /var/opt/angolacars/logs
sudo chmod -R 777 /var/opt/angolacars/logs

#chmod +x /angolacars/scripts/montar_backup_particao.sh
#chmod +x /angolacars/scripts/executar_backup.sh


