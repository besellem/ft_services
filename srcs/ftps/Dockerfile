# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/05/11 15:18:54 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add vsftpd openrc openssl --no-cache \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
	# && apk add vsftpd openrc openssl telegraf --no-cache

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=ben/CN=ftps"

RUN rm -f /etc/vsftpd/vsftpd.conf
COPY ./srcs/vsftpd.conf /etc/vsftpd/

# telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf.conf.d/telegraf.conf
# RUN mkdir -p /etc/telegraf
# COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 20000-20004

COPY ./srcs/setup.sh /tmp/
CMD sh /tmp/setup.sh
