#!/bin/sh

openrc
touch /run/openrc/softlevel

# service telegraf restart

# Server
php -S 0.0.0.0:5050 -t /www/
