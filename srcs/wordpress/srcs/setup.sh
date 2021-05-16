#!/bin/sh

openrc
touch /run/openrc/softlevel

# Server
service nginx start
php-fpm7
telegraf --config /etc/telegraf.conf

# sleep infinite
