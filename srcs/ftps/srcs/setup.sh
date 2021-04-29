#!/bin/sh

# adduser -D "adm"
# echo "adm:adm" | chpasswd
{ echo "password"; echo "password"; } | adduser ftps_user

# touch /run/openrc/softlevel

openrc boot

vsftpd /etc/vsftpd/vsftpd.conf
sleep infinite
