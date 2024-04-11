FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/ssl/private/inception.key \
			-out /etc/ssl/certs/inception.crt \
			-subj "/C=KR/ST=SEL/L=SEL/O=42/OU=42/CN=jihyeole.42.fr/UID=jihyeole"

COPY ./conf/default /etc/nginx/sites-available

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]


