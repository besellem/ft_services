# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/05 10:17:55 by besellem          #+#    #+#              #
#    Updated: 2021/04/05 12:29:36 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# docker pull alpine:3.13.4

kubectl expose rc example --port=8765 --target-port=9376 --name=example-service --type=LoadBalancer

