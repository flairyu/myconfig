#!/bin/bash

FROM=
TO=icewolfsoft.cn:
FILES="/data/www /data/mysql_bak /home/yxb/work"
SUDO_FILES="/var/lib/mysql /etc/nginx /etc/letsencrypt"
RSYNC="rsync -a"

ssh-copy-id $FROM
sudo ssh-copy-id $FROM
ssh-copy-id $TO
sudo ssh-copy-id $TO

for ffile in $FILES
do
    echo "sync: $ffile"
    echo "$RSYNC $FROM$ffile/ $TO$ffile"
    $RSYNC $FROM$ffile/ $TO$ffile
done

for ffile in $SUDO_FILES
do
    echo "sync with root: $ffile"
    echo "sudo $RSYNC $FROM$ffile/ $TO$ffile"
    sudo $RSYNC $FROM$ffile/ $TO$ffile
done

echo "Done."
echo "Next:"
echo "1. certbot"
echo "2. crontab"
