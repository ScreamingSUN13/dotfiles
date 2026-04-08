#!/usr/bin/env bash

####### Sources #######
# Grok
# W3Schools - https://www.w3schools.com/bash/index.php
# Geeksforgeeks - https://www.geeksforgeeks.org/linux-unix/bash-scripting-introduction-to-bash-and-bash-scripting/
# Youtube, You Suck at Programming, The Complete Bash Scripting Course - Full Length Guide to learning the Bash Shell
#        https://www.youtube.com/watch?v=Sx9zG7wa4FA&t=5928s

####### Varibles #######

# Formating
BOLD='\033[1m'
YELLOW='\033[33m'
UNDERLINE='\033[4m'
RESET='\033[0m'
RED='\033[0;31m'

# Package manager status
updatedPackageManagers=()
problemPackageManagers=()

# Flag Varibles | EX: -s
dryRun=false
shutdownAfter=false
rebootAfter=false

####### Functions #######

# Label makes a label for each update for debugging purposes so in the case of an error you know which package manager it was.
Label() { 
        echo -e "\n"
        echo -e ${BOLD}${YELLOW}${UNDERLINE}"${1^^}"${RESET}
}
#Same as label, just now it's red for clarity
Error() { echo -e ${BOLD}${RED}${UNDERLINE}"${1^^}"${RESET}; }

# Checks if the previous command was a success or failure and will list them at the end
successOrFailure() {
        if [[ $? == 0 ]]; then
                updatedPackageManagers+=("${1,,}")
        else
                problemPackageManagers+=("${1,,}")
        fi
}

# General update check that takes input and sees if there's a matching package manager
update() {
        local packageManager=$1
        if [[ !("${packageManager:0:1}" == "-") ]]; then
                Label "$packageManager"

                while true; do
                        case "${packageManager,,}" in
                                pacman)
                                        if command -v pacman >/dev/null 2>&1; then
                                                sudo pacman -Syu --noconfirm
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                yay)
                                        if command -v yay >/dev/null 2>&1; then
                                                yay -Syu --noconfirm
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                flatpak)
                                        if command -v flatpak >/dev/null 2>&1; then
                                                flatpak update --assumeyes
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                homebrew | brew)
                                        if command -v brew >/dev/null 2>&1; then
                                                brew update && brew upgrade && brew cleanup
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                apt)
                                        if command -v apt >/dev/null 2>&1; then
                                                sudo apt update && sudo apt dist-upgrade -y
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                zypper)
                                        if command -v zypper >/dev/null 2>&1; then
                                                sudo zypper --non-interactive --auto-agree-with-licenses update
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                snap)
                                        if command -v snap >/dev/null 2>&1; then
                                                sudo snap refresh
                                                successOrFailure $packageManager
                                        else
                                                Error "not installed"
                                                problemPackageManagers+=("${packageManager,,}")
                                                break
                                        fi
                                        ;;
                                *)
                                        Error $'is not supported\n'
                                        problemPackageManagers+=("${packageManager,,}")
                                        break
                                        ;;
                        esac

                        # If the update has an error it allows the user to retry
                        if [[ "${packageManager,,}" == "${updatedPackageManagers[-1]}" ]] 2>/dev/null; then
                                break
                        elif [[ "${packageManager,,}" == "${problemPackageManagers[-1]}" ]] 2>/dev/null; then
                                echo "Would you like to retry? (y/N)"
                                read choice
                                if [[ "${choice,,}" == n || "${choice,,}" == "" ]]; then
                                        break
                                elif [[ "${choice,,}" == y ]]; then
                                        unset problemPackageManagers[-1] 2>/dev/null
                                        problemPackageManagers=("${problemPackageManagers[@]}")
                                        continue
                                fi
                        fi
                done
        fi
}

# A GUI mode
guiMode() {
        CONTINUE='true'
        while "${CONTINUE}"; do
                echo "Which package managers would you like to update"
                echo "1) Pacman"
                echo "2) Yay"
                echo "3) Flatpak"
                echo "4) Homebrew"
                echo "5) Apt"
                echo "6) Zypper"
                echo "7) Snap"
                echo "0) Exit"
                read option
                case "${option,,}" in
                        pacman | 1)
                                update pacman
                                ;;
                        yay | 2)
                                update yay
                                ;;
                        flatpak | 3)
                                update flatpak
                                ;;
                        homebrew | brew | 4)
                                update brew
                                ;;
                        apt | 5)
                                update apt
                                ;;
                        zypper | 6)
                                update zypper
                                ;;
                        snap | 7)
                                update snap
                                ;;
                        exit | 0)
                                CONTINUE='false'
                                ;;
                        *)
                                Error $'\nNot valid input\n'
                esac
        done
}


####### Main #######

# Getting Flags
while getopts 'gdsr' OPTION; do
        case "$OPTION" in
                #g = GUI, Activates GUI mode
                g) guiMode ;;

                #d = Dry Run, allows for use of -s and -r for testing purposes without actually shutting down or rebooting your computer
                d) dryRun=true ;;

                #s = Shutdown, shuts down the computer after the script is finished.
                s) shutdownAfter=true ;;

                #r = Restart, just like s except restarts instead of shuting down.
                r) rebootAfter=true ;;
        esac
done

# Loops through arguements given
for packMan in "$@"; do
        if cat "$packMan" >/dev/null 2>&1; then #Checks if the values is a text file, if so it will turn it into an array and that for an input.
                cat "$packMan"
                echo -e "\nAre you sure you want to update the package managers (Y/n):"
                read choice
                if [[ "${choice,,}" == "y" || "${choice,,}" == "" ]]; then
                        mapfile -t toArray < $packMan
                        for txtFileLine in "${toArray[@]}"; do
                                update "$txtFileLine"
                        done
                fi
        else #If it is not a text file it will assume it is supposed to be a package manager.
                update "$packMan"
        fi
done

#Options with scripts, EX: ./update.sh -s will shutdown the computer after the updates.

if [[ $shutdownAfter == true ]]; then
        # Checks for shutdown flag
        if [[ $dryRun == false ]]; then
                Label 'SHUTTING DOWN'
                sleep 10
                sudo shutdown -h now
        else
                Label 'SHUTTING DOWN, dryrun'
                sleep 10
                echo "Shutdown"
        fi
elif [[ $rebootAfter == true ]]; then
        # Checks for restart flag
        if [[ $dryRun == false ]]; then
                Label 'REBOOTING'
                sleep 10
                sudo reboot
        else
                Label 'REBOOTING, dryrun'
                sleep 10
                echo Rebooted
        fi
fi

####### Confirmation #######

#Lists all package managers that updated successfully
Label 'Successfully updated:'
for i in "${updatedPackageManagers[@]}"; do
        echo $i
done
echo -e "\n"

#Lists all package managers that didn't update successfully
Label 'Failed updates:'
for i in "${problemPackageManagers[@]}"; do
        echo $i
done
echo -e "\n"

#End of program
Label 'ALL DONE'