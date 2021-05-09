#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

# nginx -g 'daemon off;'

# to remove
sleep infinite
