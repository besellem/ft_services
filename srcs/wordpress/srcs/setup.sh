#!/bin/sh

openrc
touch /run/openrc/softlevel

# Server
service nginx start
telegraf --config /etc/telegraf.conf

# php -S 0.0.0.0:5050 -t /www/

# sleep infinite
