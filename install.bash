#!/bin/bash

readonly PROPERTY_FILE="./.env"
readonly RED="\e[31m"
readonly GREEN="\e[32m"
readonly CYAN="\e[36m"
readonly NC="\e[0m"

get_property_value() {
  if [ -f "$PROPERTY_FILE" ]; then
    (grep -w "$1" | cut -d= -f2) <"$PROPERTY_FILE"
  fi
}

set_properties() {




array=( MYSQL_ROOT_PASSWORD two three )
for i in "${array[@]}"
do
	echo "$i"
	  # MYSQL_ROOT_PASSWORD
    get_db_password=$(get_property_value "$i")
    if [ -z "$get_db_password" ]; then
      db_password="myrootpw"
    else
      db_password="$get_db_password"
    fi
    read -r -e -i "$db_password" -p "$(echo -e "${CYAN}$i: ${NC}")" input
    db_password="${input:-$db_password}"
done







echo "MYSQL_ROOT_PASSWORD=myrootpw
MYSQL_DATABASE=mydb
MYSQL_USER=myuser
MYSQL_PASSWORD=mypw
DOCKER_IMAGE_NAME=ci-cd
GITHUB_USER=mathiasreker" > ~/.env

  echo "user=$db_username
password=$db_password
url=jdbc:mysql://$db_localhost:$db_port/stima
connection=LOCAL
port=$webserver_port" >"$PROPERTY_FILE"
}

# Create menu
echo -e "${CYAN}Installation:${NC}"
echo "1. Set properties"
echo "2. Install tables"
echo "3. Install tables and sample data"
echo "4. Exit"
echo -n "Enter your menu choice [1-4]: "

while :; do
  read -r choice

  case $choice in
  1)
    set_properties
    ;;

  2)
    run_sql_script "Installing database ..." "./src/main/resources/static/data/install.sql"
    ;;

  3)
    run_sql_script "Installing database ..." "./src/main/resources/static/data/install.sql"
    ;;

  4)
    echo "Quitting ..."
    exit
    ;;

  *) echo "invalid option" ;;

  esac
  echo -n "Enter your menu choice [1-4]: "
done