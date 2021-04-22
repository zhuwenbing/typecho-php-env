# PHP-FPM for Typecho
This project is used for building docker images for run [Typecho](https://github.com/typecho/typecho) in a docker container.

### Example of healthcheck configuration in docker compose
```script
healthcheck:
  # [Ping mode](https://github.com/renatomefi/php-fpm-healthcheck#ping-mode)
  test: [ "CMD", "php-fpm-healthcheck", "&&", "exit", "$$?" ]
  interval: 1m30s
  timeout: 10s
```
More usage of healthcheck see [php-fpm-healthcheck](https://github.com/renatomefi/php-fpm-healthcheck).
