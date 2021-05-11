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
	&& apk update && apk add wget openrc influxdb telegraf --no-cache

# telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf.conf.d/telegraf.conf

EXPOSE 8086

COPY ./srcs/setup.sh /tmp/
CMD sh /tmp/setup.sh
