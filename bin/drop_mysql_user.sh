#!/bin/bash
if [ $# -gt 0 ]; then

echo "REVOKE ALL PRIVILEGES ON $1.* FROM '$2'@'localhost';\
DROP USER $2@localhost;\
DROP DATABASE $1;" > drop.sql
sudo mysql < drop.sql && rm drop.sql

else
    echo "drop_mysql_user dbname username"
fi
