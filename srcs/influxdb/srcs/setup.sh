#!/bin/sh

openrc
touch /run/openrc/softlevel

service influxdb start
influx -execute "create database influxdb"

telegraf --config /etc/telegraf.conf

# influxd
# sleep infinite
