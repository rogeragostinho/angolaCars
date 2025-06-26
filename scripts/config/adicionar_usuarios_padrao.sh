#!/bin/bash

# Usuário para grupo recepcao
sudo useradd -m -G recepcao recep1
echo "recep1:senha123" | sudo chpasswd

# Usuário para grupo vendas
sudo useradd -m -G vendas vendedor1
echo "vendedor1:senha123" | sudo chpasswd

# Descobrir usuário atual
meu_user=$(whoami)

# Adicionar ao grupo admin
sudo usermod -aG admin "$meu_user"
