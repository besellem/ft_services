#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/11 14:38:08 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13.4

RUN apk add nginx openrc openssh openssl --no-cache

COPY setup.sh /tmp/
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 22 80 443

CMD sh /tmp/setup.sh
