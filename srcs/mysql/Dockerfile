# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/22 15:39:53 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update \
	&& apk add openrc mariadb mariadb-client --no-cache \
	&& rm -f /var/cache/apk/*

COPY ./srcs/setup.sh /tmp/
# COPY ./srcs/boot_mysql.sh /tmp/
# COPY ./srcs/mysql.cnf /etc/mysql/mysql.cnf

EXPOSE 3306

CMD sh /tmp/setup.sh
