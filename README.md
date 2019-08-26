# PHP-NGINX-Docker

An easy to use php and nginx image for docker.

## Docker Compose

```yaml

version: "2"

services:
  web:
    image: kimbtechnologies/php-nginx:latest
    container_name: php-nginx
    ports:
      - "127.0.0.1:8080:80"
    volumes:
      - ./php/:/php-code/ # load custom php code
      # - ./more-server-conf.conf:/etc/nginx/more-server-conf.conf:ro # add config options to the nginx conf (see file in repository for example)
    restart: always

```
