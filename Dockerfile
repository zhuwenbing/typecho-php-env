FROM php:8-fpm-alpine

MAINTAINER KissIce Chu <i@kissice.cc>

WORKDIR /www

RUN set -xe \
    # install depends
    && apk add --no-cache libzip-dev freetype-dev libpng-dev libjpeg-turbo-dev fcgi \
    # install core extensions
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" pdo_mysql zip \
    # clean
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    # enable php fpm status page
    && echo "pm.status_path = /status" >> /usr/local/etc/php-fpm.d/zz-docker.conf \
    # install healthcheck
    && wget -O /usr/local/bin/php-fpm-healthcheck https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
    && chmod +x /usr/local/bin/php-fpm-healthcheck
