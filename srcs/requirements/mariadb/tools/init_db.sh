#!/bin/bash 

service mariadb start

if [ ! -e /var/lib/mysql/$MARIADB_DATABASE ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
	mysql -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
