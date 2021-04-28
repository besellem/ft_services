# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/28 17:22:38 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add vsftpd openrc openssl --no-cache \
	# && apk add vsftpd --no-cache \
	&& apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/serv.crt -keyout /etc/ssl/certs/serv.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=ben/CN=website"

# RUN touch /run/openrc/softlevel

COPY ./srcs/setup.sh /tmp/
CMD sh /tmp/setup.sh

EXPOSE 21
