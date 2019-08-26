FROM php:fpm-alpine

RUN apk add --update --no-cache nginx \
	&& mkdir -p /var/lib/nginx && chown -R www-data:www-data /var/lib/nginx \
	&& mkdir -p /var/log/nginx && chown -R www-data:www-data /var/log/nginx

WORKDIR /php-code/
COPY --chown=www-data:www-data ./php/ /php-code/
COPY ./nginx.conf ./more-server-conf.conf /etc/nginx/
COPY ./startup.sh /startup.sh

CMD [ "sh", "/startup.sh" ]