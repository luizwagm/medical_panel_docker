#!/bin/bash
nocolor='\033[0m'
notice='\033[1;33m'
error='\033[1;31m'
success='\033[0;32m'
information='\033[4;35m'
sudo adduser www-data
sudo addgroup --gid 1000 www-data www-data
sudo chown -R www-data:www-data ./medical_panel_api
sudo chown -R www-data:www-data ./medical_project
echo -e "${success}Permissões alteradas com sucesso!${nocolor}"