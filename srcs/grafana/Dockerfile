# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/27 17:02:23 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

VOLUME /sys/fs/cgroup

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update && apk add wget openrc openssh openssl php7 telegraf --no-cache \
	&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
	&& wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.7.2.linux-amd64.tar.gz \
	&& rm -rf grafana-6.7.2.linux-amd64.tar.gz

RUN mkdir -p /etc/telegraf

COPY ./srcs/setup.sh /tmp/
CMD sh /tmp/setup.sh

EXPOSE 3000
