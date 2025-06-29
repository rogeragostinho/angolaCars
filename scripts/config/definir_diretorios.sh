#!/bin/bash

sudo mkdir -p /var/opt/angolacars/logs
sudo mkdir -p /var/opt/angolacars/vendas
sudo mkdir -p /var/opt/angolacars/vendas/logs
sudo mkdir -p /var/opt/angolacars/clientes_interessados
sudo mkdir -p /var/opt/angolacars/dados
sudo mkdir -p /var/opt/angolacars/logs

#temporario
#sudo touch /var/opt/angolacars/vendas/vendas.log
sudo touch /var/opt/angolacars/dados/carros.txt
sudo touch /var/opt/angolacars/vendas/logs/vendas.log