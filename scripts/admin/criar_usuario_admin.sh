#!/bin/bash

# Função: Criar usuário admin
criar_admin() {
  read -p "Nome do usuário admin: " nome
  read -s -p "Senha: " senha
  echo
  sudo useradd -m -G admin "$nome"
  echo "$nome:$senha" | sudo chpasswd
  echo "Usuário '$nome' criado no grupo admin."
}