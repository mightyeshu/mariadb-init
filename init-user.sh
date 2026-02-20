#!/bin/bash

sleep 10

if [ "$DBCP_MANAGEMENT" = "on" ]; then
mariadb -u container -e "
CREATE USER IF NOT EXISTS '${DBCP_USER}'@'%' IDENTIFIED BY '${DBCP_PASS}';
ALTER USER '${DBCP_USER}'@'%' IDENTIFIED BY '${DBCP_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${DBCP_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"
else
mariadb -u container -e "
DROP USER IF EXISTS '${DBCP_USER}'@'%';
FLUSH PRIVILEGES;"
fi