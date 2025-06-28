#!/bin/bash

# Usuário para grupo recepcao
sudo useradd -m -G angolacars,angolacars_recepcao recep1
echo "recep1:senha123" | sudo chpasswd

# Usuário para grupo vendas
sudo useradd -m -G angolacars,angolacars_vendas vendedor1
echo "vendedor1:senha123" | sudo chpasswd

# Descobrir usuário atual
meu_user=$(whoami)

# Adicionar ao grupo admin
sudo usermod -aG angolacars,angolacars_admin,angolacars_recepcao,angolacars_vendas "$meu_user"
