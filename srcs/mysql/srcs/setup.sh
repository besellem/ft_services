#!/bin/sh

openrc boot
touch /run/openrc/softlevel

# boot mariadb
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start


# wp database
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'wordpress'@'%' IDENTIFIED BY '$WP_PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* to 'wordpress'@'%' WITH GRANT OPTION;" | mysql -u root

# admin database
echo "CREATE DATABASE admin;" | mysql -u root
echo "CREATE USER 'admin'@'%' IDENTIFIED BY '$ADMIN_PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* to 'admin'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

# add wordpress template database (avoid the pain in the ass of doing the config manually)
mysql -u root "wordpress" < /tmp/wordpress.sql

# service telegraf restart

tail -f /dev/null
