# PHP-FPM for Typecho
This project reference to ohmydockerhub/typecho-php on Docker Hub.  
I have added 'healthcheck' on this basis.

### Example of healthcheck configuration in docker compose
```script
healthcheck:
  test: ["CMD", "php-fpm-healthcheck", "-v"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 30s
```
More usage of healthcheck see [php-fpm-healthcheck](https://github.com/renatomefi/php-fpm-healthcheck).
