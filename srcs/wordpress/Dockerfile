# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/27 16:51:08 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add openrc openssl nginx wget telegraf \
		php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json \
		php7-session --no-cache \
	&& mkdir /www \
	&& wget https://wordpress.org/latest.tar.gz -P /www \
	&& tar -xvf /www/latest.tar.gz -C /www \
	&& cp -a /www/wordpress/. /www \
	&& rm -rf /www/latest.tar.gz /www/wordpress/

COPY ./srcs /tmp
RUN mv /tmp/wp-config.php /www
CMD sh /tmp/setup.sh

EXPOSE 5050
