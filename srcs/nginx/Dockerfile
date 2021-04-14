# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/14 16:15:36 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

# Packages installation
RUN apk update
RUN apk add openrc
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx
RUN apk add telegraf

# Users & Permissions
RUN adduser -D -g 'www' www
RUN mkdir /serv
RUN chown -R www:www /serv
RUN chown -R www:www /var/lib/nginx

# Welcome page
COPY ./srcs/welcome /serv

# SSH
# RUN ssh-keygen -A

# SSL certificate generation
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/serv.crt -keyout /etc/ssl/certs/serv.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=ben/CN=website"

# Nginx server config
COPY ./srcs/nginx.conf /etc/nginx/

# Copy & Run script
COPY ./srcs/setup.sh /tmp
CMD sh /tmp/setup.sh

EXPOSE 22
EXPOSE 80
EXPOSE 443
