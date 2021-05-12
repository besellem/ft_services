#!/bin/sh

openrc
touch /run/openrc/softlevel

telegraf --config /etc/telegraf.conf &

cd /grafana-6.7.2/bin/ && ./grafana-server
