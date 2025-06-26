#!/bin/bash

clear
echo ""
echo "********** Projeto de Sistemas Operativos I - AngolaCars **********"
echo "          Universidade: Universidade Católica de Angola"
echo "          Disciplina: Sistemas Operativos I"
echo "          Docente: Prof. Djamila Quipipa Caetano"
echo "          Data: 10/06/2025"
echo "          Integrantes do grupo:"
echo "          1º Arildo Coutinho A. Ventura"
echo "          2º Bruna Doriana D. Cambala"
echo "          3º Efraim António V. Tanguica"
echo "          4º Roger Hugo A. Agostinho"
echo "          5º Josefa Florêncio De Gruzman"
echo "          6º Márcio Alfeu Mutambuleno"
echo ""
read -p "Pressione ENTER para entrar no menu principal..."

# MENU PRINCIPAL
while true; do
  echo ""
  echo "============= MENU PRINCIPAL ============="
  echo "1. Administrador"
  echo "2. Atendimento"
  echo "0. Sair"
  echo "=========================================="
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1)
      read -sp "Digite a senha do Administrador: " senha_admin
      echo ""
      if [[ "$senha_admin" != "123" ]]; then
        echo "❌ Senha incorreta! Acesso negado."
        continue
      fi

      # Submenu Administrador
      while true; do
        echo ""
        echo "------ MENU ADMINISTRADOR ------"
        echo "1. (Futuro) Criar utilizadores e grupos"
        echo "2. (Futuro) Fazer backup das vendas"
        echo "0. Voltar"
        echo "--------------------------------"
        read -p "Escolha uma opção: " adm_opcao

        case $adm_opcao in
          1) echo "🔧 Função ainda não implementada." ;;
          2) echo "📦 Função ainda não implementada." ;;
          0) break ;;
          *) echo "⚠️ Opção inválida!" ;;
        esac
      done
      ;;
    
    2)
      read -sp "Digite a senha do Atendimento: " senha_atend
      echo ""
      if [[ "$senha_atend" != "1234" ]]; then
        echo "❌ Senha incorreta! Acesso negado."
        continue
      fi

      # Submenu Atendimento
      while true; do
        echo ""
        echo "------ MENU ATENDIMENTO ------"
        echo "1. Recepção"
        echo "2. Área de vendas"
        echo "0. Voltar"
        echo "------------------------------"
        read -p "Escolha uma opção: " atend_opcao

        case $atend_opcao in
          1)
            # Submenu Recepção
            while true; do
              echo ""
              echo ">>> MENU RECEPÇÃO <<<"
              echo "1. Apresentar carros aos clientes"
              echo "2. Registrar clientes interessados"
              echo "0. Voltar"
              read -p "Escolha uma opção: " recep_opcao

              case $recep_opcao in
                1) echo "🚗 Carros apresentados aos clientes." ;;
                2) echo "📝 Registro de cliente interessado realizado." ;;
                0) break ;;
                *) echo "⚠️ Opção inválida!" ;;
              esac
            done
            ;;

          2)
            # Submenu Área de Vendas
            while true; do
              echo ""
              echo ">>> MENU ÁREA DE VENDAS <<<"
              echo "1. Vender automóvel"
              echo "0. Voltar"
              read -p "Escolha uma opção: " vendas_opcao

              case $vendas_opcao in
                1) echo "💰 Automóvel vendido com sucesso!" ;;
                0) break ;;
                *) echo "⚠️ Opção inválida!" ;;
              esac
            done
            ;;

          0) break ;;
          *) echo "⚠️ Opção inválida!" ;;
        esac
      done
      ;;

    0) echo "✅ Programa encerrado."; exit ;;
    *) echo "⚠️ Opção inválida!" ;;
  esac
done

