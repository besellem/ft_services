#!/bin/sh

openrc
touch /run/openrc/softlevel

telegraf --config /etc/telegraf.conf &

# Server
php -S 0.0.0.0:5050 -t /www/
