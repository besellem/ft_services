# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/21 17:02:12 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

COPY ./srcs/config.inc.php /tmp
COPY ./srcs/setup.sh /tmp

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add openrc openssl wget telegraf \
		php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json \
		php7-session php7-iconv php7-xml --no-cache \
	&& mkdir /www \
	&& wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz -P /www \
	&& tar -xvf /www/phpMyAdmin-5.1.0-english.tar.gz -C /www \
	&& rm -rf /www/phpMyAdmin-5.1.0-english.tar.gz \
	&& mv /www/phpMyAdmin-5.1.0-english /www/phpmyadmin \
	&& mv /tmp/config.inc.php /www/phpmyadmin

CMD sh /tmp/setup.sh

EXPOSE 5000
