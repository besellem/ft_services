#!/bin/sh

openrc boot

# Server
php -S 0.0.0.0:5050 -t /www/
