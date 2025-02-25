#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y

sudo apt-get install -y postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo systemctl status postgresql.service

curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install -y pgadmin4
sudo apt install -y pgadmin4-desktop
sudo apt install -y pgadmin4-web 
sudo /usr/pgadmin4/bin/setup-web.sh

