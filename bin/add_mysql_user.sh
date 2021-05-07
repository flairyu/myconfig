#!/bin/bash
if [ $# -gt 0 ]; then

echo "CREATE DATABASE $1;\
CREATE USER '$2'@'localhost' IDENTIFIED BY '$3';\
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'localhost';\
FLUSH PRIVILEGES;" > temp.sql
sudo mysql < temp.sql && rm temp.sql

else

    echo "add_mysql_user dbname username password"
fi
