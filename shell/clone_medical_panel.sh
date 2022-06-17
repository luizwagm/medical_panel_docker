#!/bin/bash
nocolor='\033[0m'
notice='\033[1;33m'
error='\033[1;31m'
success='\033[0;32m'
information='\033[4;35m'
if [ -d ./medical_project ];
then 
    echo ""
    echo -e "${success}O diretório medical_project/ já existe${nocolor}"
    sleep 1
else
    git clone https://github.com/jmgomes18/medical_project.git
    echo -e "${success}Diretório medical_project/ clonado com sucesso!${nocolor}"
fi