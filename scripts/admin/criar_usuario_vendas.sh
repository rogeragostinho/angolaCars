#!/bin/bash

# Função: Criar usuário vendas
criar_vendas() {
  read -p "Nome do usuário vendas: " nome
  read -s -p "Senha: " senha
  echo
  sudo useradd -m -G vendas "$nome"
  echo "$nome:$senha" | sudo chpasswd
  echo "Usuário '$nome' criado no grupo vendas."
}