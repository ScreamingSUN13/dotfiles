#!/bin/bash

#formating
BOLD='\033[1m'
YELLOW='\033[33m'
UNDERLINE='\033[4m'
RESET='\033[0m'

#pacman
echo -e ${BOLD}${YELLOW}${UNDERLINE}'PACMAN'${RESET}
sudo pacman -Syu --noconfirm

#yay
echo -e ${BOLD}${YELLOW}${UNDERLINE}'YAY'${RESET}
yay -Syu --noconfirm

#flatpak
echo -e ${BOLD}${YELLOW}${UNDERLINE}'FLATPAK'${RESET}
flatpak update --assumeyes

needRestart="True"

while getopts 'nsr' OPTION; do
	case "$OPTION" in
		n)
			newKernal=$(file /boot/vmlinuz-linux-cachyos | grep -o 'version [^ ]*' | cut -d' ' -f2)
			runningKernal=$(uname -r)

			if [ "$newKernal" == "$runningKernal" ]; then
				needRestart="False"
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'NO REBOOT NEEDED'${RESET}
			fi
			;;
		s)
			if [ "$needRestart" == "True" ]; then
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'SHUTTING DOWN'${RESET}
				sleep 10
				sudo shutdown -h now
			fi
			;;
		r)
			if [ "$needRestart" == "True" ]; then
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'REBOOTING'${RESET}
				sleep 10
				sudo reboot
			fi
			;;
	esac
done

#confirmation
echo -e ${BOLD}${YELLOW}${UNDERLINE}'ALL DONE'${RESET}
