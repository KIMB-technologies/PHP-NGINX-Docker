FROM php:fpm-alpine

# install nginx
RUN apk add --update --no-cache nginx \
	&& mkdir -p /var/lib/nginx && chown -R www-data:www-data /var/lib/nginx \
	&& mkdir -p /var/log/nginx && chown -R www-data:www-data /var/log/nginx \
	&& mkdir -p /var/tmp/nginx && chown -R www-data:www-data /var/tmp/nginx/

# set fpm to listen locally, allow status ping to fpm 
RUN echo -e "\n[www]\n listen = 127.0.0.1:9000\n" > /usr/local/etc/php-fpm.d/zz-local-only.conf \
	&& echo -e "\n[www]\nping.path = /healthz\nping.response = healthy\naccess.suppress_path[] = /healthz\n" > /usr/local/etc/php-fpm.d/zz-healthz.conf

# define the HEALTHCHECK (pings fpm via nginx)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
	CMD curl -fsS http://127.0.0.1:9001/healthz || exit 1

# add config and php scripts
WORKDIR /php-code/
COPY --chown=www-data:www-data ./php/ /php-code/
COPY ./nginx/*.conf /etc/nginx/
COPY ./sh/startup.sh /startup.sh

# mark the open port
EXPOSE 80/tcp

# run nginx and php-fpm
CMD [ "sh", "/startup.sh" ]
