#!/bin/bash
sudo reflector --verbose --sort rate -l 30 -c US -p 'https' --save /etc/pacman.d/mirrorlist
