#!/bin/sh

# Replace ip in wordpress config by the real one, given by minikube
SERVICE_IP=$(cat /tmp/svc_ip)
sed -i 's/IP_HERE/$SERVICE_IP/g' /www/wp-config.php

openrc boot
rc-service nginx start

# Server
php -S 0.0.0.0:5050 -t /www/

# => Remove
sh
