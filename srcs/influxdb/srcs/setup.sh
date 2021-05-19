#!/bin/sh

openrc
touch /run/openrc/softlevel

service influxdb start

sleep 2

influx -execute "create database influxdb"

telegraf --config /etc/telegraf.conf
