#!/bin/sh

openrc
touch /run/openrc/softlevel

service influxdb start
influx -execute "create database nginx"
influx -execute "create database wordpress"
influx -execute "create database phpmyadmin"
influx -execute "create database mysql"
influx -execute "create database ftps"
influx -execute "create database grafana"
influx -execute "create database influxdb"

service telegraf restart

# influxd
sleep infinite
