#!/bin/bash

# Define the paths to the configuration files
POSTGRESQL_CONF="/etc/postgresql/16/main/postgresql.conf"
PG_HBA_CONF="/etc/postgresql/16/main/pg_hba.conf"

sudo sed -i 's/^#listen_addresses =.*/listen_addresses = '\''*'\''/' "$POSTGRESQL_CONF"

sudo echo "local    all             all                            trust" > "$PG_HBA_CONF"
sudo echo "host    all             all             all               trust" >> "$PG_HBA_CONF"

sudo systemctl restart postgresql
sudo service postgresql restart
