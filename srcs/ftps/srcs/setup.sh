#!/bin/sh

adduser -D "admin"
echo "admin:admin" | chpasswd

openrc

# service telegraf restart

vsftpd /etc/vsftpd/vsftpd.conf
