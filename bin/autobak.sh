#!/bin/bash
DBUSER=root
DBPSWD=
DBSVR=localhost
DBLIST="iwreg" # split with space
DATESTR=$(date +%Y-%m-%d)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

for DB in $DBLIST
do
    echo "backup: $DB"
    # mysqldump -h$DBSVR -u$DBUSER -p$DBPSWD $DB>$DB-$(date +%Y-%m-%d).sql
    mysqldump -h$DBSVR -u$DBUSER $DB>$DB-$(date +%Y-%m-%d).sql
done
