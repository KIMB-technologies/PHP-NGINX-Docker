#!/bin/sh
if [ -f "/startup-before.sh" ]; then
	sh /startup-before.sh
fi;
nginx -g 'pid /tmp/nginx.pid;'
php-fpm