# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/05 10:17:55 by besellem          #+#    #+#              #
#    Updated: 2021/05/09 12:46:03 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Ansi color codes
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
GRAY="\033[0;37m"
B_BLACK="\033[1;30m"
B_RED="\033[1;31m"
B_GREEN="\033[1;32m"
B_YELLOW="\033[1;33m"
B_BLUE="\033[1;34m"
B_PURPLE="\033[1;35m"
B_CYAN="\033[1;36m"
B_GRAY="\033[1;37m"
CLR_COLOR="\033[0m"
CLR_LINE="\033[2K\r"
CLR_SCREEN="\033[2J\033[H"


# header generated by figlet command
echo "$CLR_SCREEN$B_RED\
 / _| |_     ___  ___ _ ____   _(_)
| |_| __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|  \__|___|___/\___|_|    \_/ |_|\___\___||___/
       |_____|$CLR_COLOR\n
🖥  - $B_YELLOW"$(uname)$CLR_COLOR "\n"



### whitout this cmd, minikube can't found images built locally
# eval $(minikube docker-env)


# Install minikube command
install_minikube_cmd() {

	if [ `uname` = Darwin ]
	then
		
		# Check if minikube does not exist
		if [ ! -x `command -v minikube` ]
		then
			# check if brew does not exist
			if [ ! -x `command -v brew` ]
			then
				echo "Installing Homebrew..."
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
			fi
			brew install kubectl minikube
		fi

		# if $MINIKUBE_HOME does not exist in .zshrc, add it
		if [ -z $MINIKUBE_HOME ]
		then
			grep MINIKUBE_HOME $HOME/.zshrc > /dev/null
			if [ $? -eq 1 ]
			then
				echo "export MINIKUBE_HOME=/goinfre/\$USER/" >> $HOME/.zshrc
			fi
		fi
	elif [ `uname` = Linux ]
	then
		if [ ! -x `command -v minikube` ]
		then
			echo "'minikube' is not installed on your system"
		fi
	else
		echo "You cannot run this on your system."
		echo "Too bad"
	fi
}


# Start minikube, its addons and metallb
start() {
	
	install_minikube_cmd

	echo "Starting minikube..."
	
	## Launch minikube
	if [ `uname` = Darwin ]
	then
		minikube start --vm-driver=virtualbox --memory=2g --cpus=2 --extra-config=apiserver.service-node-port-range=1-35000
	elif [ `uname` = Linux ]
	then
		minikube start --driver=docker --extra-config=apiserver.service-node-port-range=1-35000
	fi

	# minikube addons enable dashboard
	# minikube addons disable metrics-server

	# minikube dashboard

	## Install metallb
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

	# Main yaml file
	kubectl apply -f ./srcs/configmap.yaml
}

# Launch dashboard (thanks @kaye)
install_dashboard() {
	# install kubernetes dashboard
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml 2>/dev/null 1>&2

	# create admin token
	if ! kubectl -n kube-system describe secret | grep admin-token 2>/dev/null 1>&2 ; then
		echo ""$GREEN"\n:tools:  create admin token ..."$CLR_COLOR"\n\n"
		kubectl create -f ./srcs/admin-token.yaml
	fi

	# show token
	echo ""$GREEN$CLR_SCREEN":tools:  Plead copy the "Token" code to connect dashboard"$CLR_COLOR"\n"
	kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^admin-token-/{print $1}') | awk '$1=="token:"{print $2}'

	# open dashboard
	echo ""$GREEN"\n:tools:  open the dashboard ..."$CLR_COLOR"\n"
	if [ `uname` = Linux ]
	then
		xdg-open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
	else
		open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
	fi

	# starting dashboard proxy
	echo ""$GREEN":tools:  Please refresh the dashboard page when you see "Starting to serve on [...] ...""$CLR_COLOR"\n"
	kubectl proxy

	# TIPS 1 : if the dashboard page shows nothing, try add "login" like [...]/proxy/#/login or just change browser
	# TIPS 2 : if you can't log in to the dashboard, try wipe off "login" like [...]/proxy/#/
}


# Start all services
setup() {

	### whitout this cmd, minikube can't found images built locally
	eval $(minikube docker-env)

	SVC_IP=$(minikube ip)
	
	echo "# Building"$B_RED" images..."$CLR_COLOR

	for ctnr in 'nginx' 'wordpress' 'phpmyadmin' 'mysql' 'ftps'
	do
		docker build -t svc_$ctnr ./srcs/$ctnr
	done

	for ctnr in 'nginx' 'wordpress' 'phpmyadmin' 'mysql' 'ftps'
	do
		kubectl apply -f ./srcs/$ctnr/$ctnr.yaml
	done

	# apply yamls
	# kubectl apply -f ./srcs/grafana/grafana.yaml
	# kubectl apply -f ./srcs/influxdb/influxdb.yaml

	install_dashboard
	
	# open nginx welcome page in browser
	# open http://$SVC_IP:80
}


# If no arg, or first arg equals "start" or "restart":
# Start / Restart script
if [ $# -lt 1 ] || [ $1 = "start" ]
then
	start
elif [ $1 = "delete" ] || [ $1 = "stop" ]
then
	# Delete minikube instances if minikube is running & exist
	minikube ip > /dev/null 2>&1
	if [ $? -eq 0 ] && [ -x `command -v minikube` ]
	then
		echo "Clearing docker images..."
		docker rmi --force svc_nginx svc_ftps svc_grafana svc_influxdb svc_mysql svc_phpmyadmin svc_wordpress alpine 2>/dev/null
		minikube delete
	else
		echo "Nothing to delete 🤘"
	fi
elif [ $1 = "services" ]
then
	# start minikube if not running
	minikube ip > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		start
	fi
	setup
elif [ $1 = "install" ]
then
	# install_minikube_cmd
	install_dashboard
fi

# Set env variable when exiting
zsh
