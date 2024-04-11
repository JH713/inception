FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update -y && \
	apt-get install -y wget curl php php-fpm \
	php-mysql php-mbstring mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

COPY ./tools/init_wp.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init_wp.sh

EXPOSE 9000

ENTRYPOINT ["init_wp.sh"]


