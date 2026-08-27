#!/bin/bash
while getopts 'yl' OPTION; do
	case "$OPTION" in
		y)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UFh3WAdzMbI5xeS9Uh0oUwu&si=n3v4v-9aPnZ04HUj"
			;;
		l)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UEbgiuzE3TdXEEK1QutFiAL"
			;;
	esac
done
