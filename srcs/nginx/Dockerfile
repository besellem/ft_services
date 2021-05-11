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

VOLUME /sys/fs/cgroup

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
	&& apk update && apk add openrc openssh openssl nginx telegraf --no-cache

# Users & Permissions
RUN adduser -D -g 'www' www
RUN mkdir /serv
RUN chown -R www:www /serv
RUN chown -R www:www /var/lib/nginx

# Welcome page
COPY ./srcs/welcome /serv

# SSL certificate generation
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/serv.crt -keyout /etc/ssl/certs/serv.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=ben/CN=website"

# SSH
RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    echo "root:admin" | chpasswd

RUN mkdir /run/nginx

# Nginx server config
COPY ./srcs/nginx.conf /etc/nginx/

# telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf.conf.d/telegraf.conf

EXPOSE 22 80 443

# Copy & Run script
COPY ./srcs/liveness.sh /tmp
COPY ./srcs/setup.sh /tmp
CMD sh /tmp/setup.sh
