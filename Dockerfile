FROM php:8-fpm-alpine

MAINTAINER KissIce Chu <i@kissice.cc>

RUN set -eux; \
    apk upgrade --update; \
    # install depends
    apk add --no-cache --virtual .build-deps \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
    ; \
    # install core extensions
    docker-php-ext-configure gd --with-freetype --with-jpeg; \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd; \
    docker-php-ext-configure zip --with-libzip; \
    docker-php-ext-install -j$(nproc) gd pdo_mysql zip; \
    apk del .build-deps; \
    apk add --update \
        freetype \
        libjpeg \
        libpng \
        libzip \
        fcgi \
    ; \
    # clean
    rm -rf /var/cache/apk/*; \
    rm -rf /tmp/*; \
    # enable php fpm status page
    echo "pm.status_path = /status" >> /usr/local/etc/php-fpm.d/zz-docker.conf; \
    # install healthcheck
    wget -O /usr/local/bin/php-fpm-healthcheck https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck; \
    chmod +x /usr/local/bin/php-fpm-healthcheck
