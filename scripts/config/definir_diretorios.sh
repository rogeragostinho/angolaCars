#!/bin/bash

sudo mkdir -p /var/opt/angolacars/logs
sudo mkdir -p /var/opt/angolacars/vendas
sudo mkdir -p /var/opt/angolacars/recepcao
sudo mkdir -p /var/opt/angolacars/dados

sudo touch /var/opt/angolacars/logs/sistema.log
sudo touch /var/opt/angolacars/vendas/historico.csv
sudo touch /var/opt/angolacars/recepcao/interessados.csv
sudo touch /var/opt/angolacars/dados/carros.txt
