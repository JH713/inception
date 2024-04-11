FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/

COPY ./tools/init_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_db.sh

EXPOSE 3306

ENTRYPOINT ["init_db.sh"]
