#!/bin/bash

# Define the paths to the configuration files
POSTGRESQL_CONF="/etc/postgresql/16/main/postgresql.conf"
PG_HBA_CONF="/etc/postgresql/16/main/pg_hba.conf"

sed -i 's/^#listen_addresses =.*/listen_addresses = '\''*'\''/' "$POSTGRESQL_CONF"

echo "host    all             all             0.0.0.0/0               md5" >> "$PG_HBA_CONF"

sudo systemctl restart postgresql
sudo service postgresql restart