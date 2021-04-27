#!/bin/sh

openrc boot
touch /run/openrc/softlevel
service nginx restart

# /usr/sbin/sshd
# nginx -g 'daemon off;'

# to remove
sleep infinite
# sh
