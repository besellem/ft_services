#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

telegraf --config /etc/telegraf.conf

# sleep infinite
