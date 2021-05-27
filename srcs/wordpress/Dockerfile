# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/05/11 11:28:42 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add openrc openssl nginx wget telegraf \
		php7 php7-fpm php7-common php7-session php7-iconv php7-json \
		php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi \
		fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
		php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom --no-cache \
	&& mkdir /www \
	&& wget https://wordpress.org/latest.tar.gz -P /www \
	&& tar -xvf /www/latest.tar.gz -C /www \
	&& cp -a /www/wordpress/. /www \
	&& rm -rf /www/latest.tar.gz /www/wordpress/

RUN mkdir /run/nginx
RUN rm -f /etc/nginx/http.d/default.conf
COPY ./srcs/nginx.conf /etc/nginx/http.d/

# telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf.conf.d/telegraf.conf

COPY ./srcs/wp-config.php /www

EXPOSE 5050

COPY ./srcs/liveness.sh /tmp
COPY ./srcs/setup.sh /tmp/
CMD sh /tmp/setup.sh
