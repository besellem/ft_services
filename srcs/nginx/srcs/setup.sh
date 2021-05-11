#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

# nginx -g 'daemon off;'

# service telegraf restart

# to remove
sleep infinite
