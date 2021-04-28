#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

# /usr/sbin/sshd
# nginx -g 'daemon off;'

# to remove
sleep infinite
# sh
