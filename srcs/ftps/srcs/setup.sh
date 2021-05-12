#!/bin/sh

adduser -D "admin"
echo "admin:admin" | chpasswd

openrc

telegraf --config /etc/telegraf.conf &

vsftpd /etc/vsftpd/vsftpd.conf
