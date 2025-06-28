#!/bin/bash

# Função: Criar usuário recepção
criar_recepcao() {
  read -p "Nome do usuário recepção: " nome
  read -s -p "Senha: " senha
  echo
  sudo useradd -m -G recepcao "$nome"
  echo "$nome:$senha" | sudo chpasswd
  echo "Usuário '$nome' criado no grupo recepção."
}