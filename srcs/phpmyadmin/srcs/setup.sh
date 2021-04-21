#!/bin/sh

openrc boot
# rc-service nginx start

# Server
php -S 0.0.0.0:5000 -t /www/phpmyadmin
