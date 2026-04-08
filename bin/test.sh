#!/bin/bash

#formating
BOLD='\033[1m'
YELLOW='\033[33m'
UNDERLINE='\033[4m'
RESET='\033[0m'

state="none"
wantupdate="false"
#update mirror list
while getopts 'mns' OPTION; do
	case "$OPTION" in
		m)
			echo all clear option M
			;;
		n)
			wantupdate="True" 
			;;
		s)
			state="shutdown"
			;;
	esac
done

needUpdate="True"

if ["$wantupdate" == "True"]; then
	s1=$(pacman -Q linux | sed 's/linux //')
	s2=$(uname -r | sed 's/-ARCH//')

	if [ "$s1" == "$s2" ]; then
		needUpdate="False"
		echo NO REBOOT NEEDED
	else
		echo error
	fi
fi
if ["$state" == "shutdown"]; then
	if [ "$needUpdate" == "True" ]; then
		echo reboot needed
	else
		echo error restart
	fi
fi
