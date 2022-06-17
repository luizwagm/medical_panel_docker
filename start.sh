#!/bin/bash
x="teste"
nocolor='\033[0m'
notice='\033[1;33m'
error='\033[1;31m'
success='\033[0;32m'
information='\033[4;35m'

press_to_continue ()
{
    sleep 1
    echo "================================================";
    read -s -n 1 -p "Precione qualquer tecla pra continuar..."
    echo "================================================";
}

menu ()
{
while true $x != "teste"
do
  clear
  echo "================================================"
  echo -e "${notice}1)Build containers (do zero)."
  echo "3)Executar migrations"
  echo "4)Ver status"
  echo "5)Derrubar ambientes"
  echo "6)Entrar no container (ssh)"
  echo "10)Trocar hosts local"
  echo "20)Sair"
  echo -e "${nocolor}================================================"

  echo "Digite a opção desejada:"
  read x
  echo -e "${information}Opção informada ($x)${nocolor}"
  echo "================================================"
  clear

  case "$x" in
      1)
        echo -e "${information}Build dos containers${nocolor}"

        sudo chmod -R 755 ./shell/*

        ./shell/clone_medical_panel_api.sh
        ./shell/clone_medical_panel.sh
        ./shell/alterar_permissao_pasta.sh
        
        docker-compose up --build -d
        sleep 60
       
        ./shell/executar_migrations.sh
        ./shell/executar_front.sh
        ./shell/add_hosts.sh

        echo "================================================"
        echo -e "${success}Ambientes buildados e prontos para usar!${nocolor}"
        echo "================================================"

        press_to_continue
  ;;
      3)
        echo -e "${information}Executando migrations${nocolor}"
        ./shell/executar_migrations.sh
        press_to_continue
  ;;
      4)
        echo -e "${information}Ver status${nocolor}"
        docker ps
        sleep 1
        docker-compose ps
        press_to_continue
  ;;
      5)
        qual_ambiente="todos"
        echo -e "${information}Derrubar ambientes${nocolor}"
        docker-compose down
        sleep 1
        docker ps
        press_to_continue
  ;;
      6)
        qual_ambiente="app"
        echo -e "${information}Entrar no container${nocolor}"

        echo "Qual ambiente deseja entrar? [app|api|mysql]"
        read qual_ambiente
        clear;

        if [ "$qual_ambiente" = "app" ] || [ "$qual_ambiente" = "" ];
        then  
          docker exec -it medical_panel_app bash
        elif [ "$qual_ambiente" = "api"];
        then  
          docker exec -it medical_panel_api bash
        else
          docker exec -it medical_panel_database bash
        fi
        clear;
  ;;
      10)
        echo -e "${error}Atribuir hosts${nocolor}"
        ./shell/add_hosts.sh
        clear;
        press_to_continue
  ;;
      20)
        echo -e "${error}saindo...${nocolor}"
        sleep 1
        clear;
        exit;
        echo "================================================"
  ;;

  *)
          echo -e "${error}Opção inválida!${nocolor}"
  esac
done

}
menu