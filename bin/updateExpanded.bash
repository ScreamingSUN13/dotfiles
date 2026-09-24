#Linux
#!/bin/bash

#Mac
#!/opt/homebrew/bin/bash

####### Sources #######
# Grok
# W3Schools - https://www.w3schools.com/bash/index.php
# Geeksforgeeks - https://www.geeksforgeeks.org/linux-unix/bash-scripting-introduction-to-bash-and-bash-scripting/
# Youtube, You Suck at Programming, The Complete Bash Scripting Course - Full Length Guide to learning the Bash Shell
#	 https://www.youtube.com/watch?v=Sx9zG7wa4FA&t=5928s

####### Formating Varibles #######
BOLD='\033[1m'
YELLOW='\033[33m'
UNDERLINE='\033[4m'
RESET='\033[0m'
RED='\033[0;31m'

####### Functions #######

#Label makes a label for each update for debugging purposes so in the case of an error you know which package manager it was.
Label() { echo -e ${BOLD}${YELLOW}${UNDERLINE}"${1^^}"${RESET}; }

#General update check that takes input and sees if there's a matching package manager
update() {
	local packageManager=$1

	if [[ !("${packageManager:0:1}" == "-") ]]; then
		Label "$packageManager"

		if [[ "${packageManager,,}" == *"pacman"* ]]; then
			sudo pacman -Syu --noconfirm
		elif [[ "${packageManager,,}" == *"yay"* ]]  ; then
			yay -Syu --noconfirm
		elif [[ "${packageManager,,}" == *"flatpak"* ]]; then
			flatpak update --assumeyes
		elif [[ "${packageManager,,}" == "homebrew" || "${packageManager,,}" == "brew" ]]; then
			brew update
			brew upgrade
			brew cleanup
		elif [[ "${packageManager,,}" == "apt" ]]; then
			sudo apt update && sudo apt dist-upgrade -y
		elif [[ "${packageManager,,}" == "zypper" ]]; then
			sudo zypper --non-interactive --auto-agree-with-licenses update
		else
			echo -e ${BOLD}${RED}${UNDERLINE}'is not supported\n'${RESET}
		fi
	fi
}


####### Main #######

# Loops through arguements given
for packMan in "$@"; do
	if cat "$packMan" >/dev/null 2>&1; then #Checks if the values is a text file, if so it will turn it into an array and that for an input.
		echo -e "\n\nAre you sure you want to update the package managers (Y/n):"
		read choice
		if [[ "${choice,,}" == "y" || "${choice,,}" == "" ]]; then
			mapfile -t toArray < $packMan
			for line in "${toArray[@]}"; do
				update "$line"
			done
		fi
	else #If it is not a text file it will assume it is supposed to be a package manager.
		update "$packMan"
	fi
done


#Keeps varible to know if the computer needs a restart, for now I assume true
needRestart="True"

#Options with scripts, EX: ./update.sh -s will shutdown the computer after the updates.
while getopts 'nsr' OPTION; do
	case "$OPTION" in
		#n = Needs, meant to be paired with one of the bottom two. This checks if the computer needs a restart.
		n)
			newKernal=$(file /boot/vmlinuz-linux-cachyos | grep -o 'version [^ ]*' | cut -d' ' -f2)
			runningKernal=$(uname -r)

			if [ "$newKernal" == "$runningKernal" ]; then
				needRestart="False"
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'NO REBOOT NEEDED'${RESET}
			fi
			;;

		#s = Shutdown, shuts down the computer after the script is finished. Can be paired with n for a shutdown only if needed.
		s)
			if [ "$needRestart" == "True" ]; then
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'SHUTTING DOWN'${RESET}
				sleep 10
				sudo shutdown -h now
			fi
			;;

		#r = Restart, just like s except restarts instead of shuting down
		r)
			if [ "$needRestart" == "True" ]; then
				echo -e ${BOLD}${YELLOW}${UNDERLINE}'REBOOTING'${RESET}
				sleep 10
				sudo reboot
			fi
			;;
	esac
done

####### Confirmation #######
Label 'ALL DONE'
