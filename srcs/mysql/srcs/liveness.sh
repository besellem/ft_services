# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    liveness.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 14:57:35 by besellem          #+#    #+#              #
#    Updated: 2021/05/09 15:25:40 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if ! service mariadb status | grep started ;
then
	service mariadb restart
fi
