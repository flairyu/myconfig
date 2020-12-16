#!/bin/bash
apt-get update && apt-get install -y \
    curl \
    vim \
    procps \
    libssl-dev \
    libreadline-dev \
    libcurl4-openssl-dev 

apt-get install -y \
    mariadb-server \
    mariadb-client \
    php \
    php-fpm \
    php-bz2 php-cli php-curl php-gd php-json php-mbstring php-mysql php-readline php-xml php-zip \
    php-bcmath php-common php-tokenizer \
    nginx \
    coturn \
    cron \
    certbot python-certbot-nginx


