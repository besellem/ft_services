#!/bin/sh

adduser -D "adm"
echo "adm:adm" | chpasswd

touch /run/openrc/softlevel

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=ben/CN=ftps"

# echo "seccomp_sandbox=NO"			>> /etc/vsftpd/vsftpd.conf
# echo "ssl_enable=YES"				>> /etc/vsftpd/vsftpd.conf
# echo "allow_anon_ssl=NO"			>> /etc/vsftpd/vsftpd.conf
# echo "force_local_data_ssl=YES"		>> /etc/vsftpd/vsftpd.conf
# echo "force_local_logins_ssl=YES"	>> /etc/vsftpd/vsftpd.conf
# echo "ssl_tlsv1_1=YES"				>> /etc/vsftpd/vsftpd.conf
# echo "ssl_tlsv1_2=YES"				>> /etc/vsftpd/vsftpd.conf
# echo "ssl_tlsv1=NO"					>> /etc/vsftpd/vsftpd.conf
# echo "ssl_sslv2=NO"					>> /etc/vsftpd/vsftpd.conf
# echo "ssl_sslv3=NO"					>> /etc/vsftpd/vsftpd.conf
# echo "require_ssl_reuse=YES"		>> /etc/vsftpd/vsftpd.conf
# echo "ssl_ciphers=HIGH"				>> /etc/vsftpd/vsftpd.conf
# echo "rsa_cert_file=/etc/ssl/certs/vsftpd.crt"			>> /etc/vsftpd/vsftpd.conf
# echo "rsa_private_key_file=/etc/ssl/private/vsftpd.key"	>> /etc/vsftpd/vsftpd.conf

openrc boot
# service vsftpd start

# sh
sleep infinite

# /usr/sbin/vsftpd
