#!/bin/sh

openrc
touch /run/openrc/softlevel

# Server
php-fpm7
telegraf --config /etc/telegraf.conf &
nginx -g 'daemon off;'
