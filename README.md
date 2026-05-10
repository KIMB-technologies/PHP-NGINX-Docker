# PHP-NGINX-Docker

An easy to use php and nginx image for Docker.

Currently available for AMD64, ARMv6, ARMv7 and ARM64 (v8).

## Docker Command

Quick startup, there will be a `phpinfo();` at `http://127.0.0.1:8080` after startup.

```bash

docker run -p 8080:80 kimbtechnologies/php_nginx

```

## Docker Compose

Example file for a Docker Compose setup with own php code: [`docker-compose.yml`](./docker-compose.yml)

