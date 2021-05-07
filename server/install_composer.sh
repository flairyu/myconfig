#!/bin/bash
wget https://mirrors.aliyun.com/composer/composer.phar
chmod +x composer.phar
mv composer.phar $HOME/bin/composer
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
echo 'Done'
# uninstall
# rm $HOME/bin/composer
# composer config -g --unset repos.packagist
