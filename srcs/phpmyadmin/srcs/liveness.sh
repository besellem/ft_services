# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    liveness.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 14:57:35 by besellem          #+#    #+#              #
#    Updated: 2021/05/09 14:58:06 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if ! pidof nginx ;
then
	service nginx restart
fi

if ! pidof php-fpm7 ;
then
	php-fpm7
fi
