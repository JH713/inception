#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

	chown -R www-data:www-data /var/www/html
	
	wp core download \
	--allow-root \
	--path=/var/www/html
	
	wp config create \
	--allow-root \
	--dbname=$MARIADB_DATABASE \
	--dbuser=$MARIADB_USER \
	--dbpass=$MARIADB_PASSWORD \
	--dbhost=$MARIADB_HOSTNAME \
	--path=/var/www/html

	wp core install \
	--allow-root \
	--url=$WORDPRESS_URL \
	--title=$WORDPRESS_TITLE \
	--admin_user=$WORDPRESS_ADMIN \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \
	
	wp user create \
	--allow-root --role=author \
	$WORDPRESS_USER $WORDPRESS_USER_EMAIL \
	--user_pass=$WORDPRESS_USER_PASSWORD 
fi

exec "php-fpm7.4" "-F"
