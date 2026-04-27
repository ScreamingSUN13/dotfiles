#!/bin/bash

#formating
BOLD='\033[1m'
YELLOW='\033[33m'
UNDERLINE='\033[4m'
RESET='\033[0m'

# Label makes a label for each update for debugging purposes so in the case of an error you know which package manager it was.
Label() { echo -e ${BOLD}${YELLOW}${UNDERLINE}"${1^^}"${RESET};}

#pacman
Label PACMAN
sudo pacman -Syu --noconfirm

#yay
Label YAY
yay -Syu --noconfirm

#flatpak
Label FLATPAK
flatpak update --assumeyes

#lazy-nvim
Label lazy-nvim
nvim --headless "+Lazy! sync" +qa

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
