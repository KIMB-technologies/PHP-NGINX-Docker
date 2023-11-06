# PHP-NGINX-Docker

An easy to use php and nginx image for Docker.

Currently build for AMD64, ARMv6, ARMv7 and ARM64 (v8).

## Docker Command

Quick startup, there will be a `phpinfo();` at `http://127.0.0.1:8080` after startup.

```bash

docker run -p 8080:80 kimbtechnologies/php_nginx

```

## Docker Compose

Example file for a Docker Compose setup with own php code.

```yaml

version: "2"

services:
  web:
    image: kimbtechnologies/php_nginx:latest # uses php 8.*
    container_name: php_nginx
    ports:
      - "127.0.0.1:8080:80"
    volumes:
      - ./php/:/php-code/ # load custom php code
      # - ./more-server-conf.conf:/etc/nginx/more-server-conf.conf:ro # add config options to the nginx conf (see file in repository for example)
      # - ./init.sh:/startup-before.sh # script to be run before php, nginx startup (e.g. for system updates, ..., runs as root)
    restart: always

```
