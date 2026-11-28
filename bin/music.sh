#!/bin/bash

playlist="None"
while getopts 'ylocu' OPTION; do
	case "$OPTION" in
		y)
			playlist="Yes"
			;;
		l)
			playlist="Lofi"
			;;
		o)
			playlist="OuterWilds"
			;;
		c)
			playlist="ClairObscur"
			;;
		u)
			playlist="Ultrakill"
			;;
	esac
done

case $playlist in
	"Yes")
		cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UFh3WAdzMbI5xeS9Uh0oUwu&si=n3v4v-9aPnZ04HUj"
		;;
	"Lofi")
		cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UEbgiuzE3TdXEEK1QutFiAL"
		;;
	"OuterWilds")
		cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UHnFCDB8EkkLYS7FQfMHUsw&si=2cVz4O4HnKIvBEyp"
		;;
	"ClairObscur")
		cliamp "https://music.youtube.com/playlist?list=PLZrc4rLojX50&si=AEG1RlvZ1zxwnK5G"
		;;
	"Ultrakill")
		cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UFNLSeEhtotmOYutp785oWp&si=jxzXSaJmrU1gROD_"
		;;
	"None")
		cliamp --provider ytmusic
esac
