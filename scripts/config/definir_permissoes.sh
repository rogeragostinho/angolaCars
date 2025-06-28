#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo chown -R :angolacars_admin $BASE_DIR/../admin
sudo chmod -R 770 $BASE_DIR/../admin

sudo chown -R :angolacars_recepcao $BASE_DIR/../recepcao
sudo chmod -R 770 $BASE_DIR/../recepcao

sudo chown -R :angolacars_vendas $BASE_DIR/../vendas
sudo chmod -R 770 $BASE_DIR/../vendas

sudo sudo chown -R :angolacars $BASE_DIR/../compartilhado
sudo chmod -R 770 $BASE_DIR/../compartilhado

sudo sudo chown -R :angolacars /var/opt/angolacars
sudo chmod -R 770 /var/opt/angolacars
