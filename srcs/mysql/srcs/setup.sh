#!/bin/sh


# openrc boot
# /etc/init.d/mariadb setup &>/dev/null
# /tmp/boot_mysql.sh > /dev/null 2>&1 &

# until mysql
# do
# 	echo "mysql is booting..."
# done

# echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

# openrc boot
# /etc/init.d/mariadb setup &>/dev/null
# /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
# /etc/init.d/mariadb setup
# myslq
# mysql
# /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

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


tail -f /dev/null
# sh
