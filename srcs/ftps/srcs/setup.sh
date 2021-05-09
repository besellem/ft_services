#!/bin/sh

adduser -D "admin"
echo "admin:admin" | chpasswd

openrc boot
vsftpd /etc/vsftpd/vsftpd.conf
