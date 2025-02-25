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

# Define the paths to the configuration files
POSTGRESQL_CONF="/path/to/postgresql.conf"
PG_HBA_CONF="/path/to/pg_hba.conf"

sed -i 's/^#listen_addresses =.*/listen_addresses = '\''*'\''/' "$POSTGRESQL_CONF"

echo "host    all             all             0.0.0.0/0               md5" >> "$PG_HBA_CONF"

sudo systemctl restart postgresql
sudo service postgresql restart