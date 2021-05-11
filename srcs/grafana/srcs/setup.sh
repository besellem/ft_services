#!/bin/sh

openrc
touch /run/openrc/softlevel

service telegraf restart

cd /grafana-6.7.2/bin/ && ./grafana-server
