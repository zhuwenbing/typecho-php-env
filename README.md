# PHP-FPM for Typecho
This project reference to [ohmydockerhub/typecho-php](https://hub.docker.com/r/ohmydockerhub/typecho-php) on Docker Hub.  
I have added 'healthcheck' on this basis.

### Example of healthcheck configuration in docker compose
```script
healthcheck:
  # [Ping mode](https://github.com/renatomefi/php-fpm-healthcheck#ping-mode)
  test: [ "CMD", "php-fpm-healthcheck", "&&", "exit", "$$?" ]
  interval: 1m30s
  timeout: 10s
```
More usage of healthcheck see [php-fpm-healthcheck](https://github.com/renatomefi/php-fpm-healthcheck).
