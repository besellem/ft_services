# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 09:17:39 by user42            #+#    #+#              #
#    Updated: 2021/04/28 11:43:38 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk add nginx openrc openssh openssl --no-cache

COPY setup.sh /tmp/
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 21

CMD sh /tmp/setup.sh
