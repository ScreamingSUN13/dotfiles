#!/bin/bash
while getopts 'ylocu' OPTION; do
	case "$OPTION" in
		y)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UFh3WAdzMbI5xeS9Uh0oUwu&si=n3v4v-9aPnZ04HUj"
			;;
		l)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UEbgiuzE3TdXEEK1QutFiAL"
			;;
		o)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UHnFCDB8EkkLYS7FQfMHUsw&si=2cVz4O4HnKIvBEyp"
			;;
		c)
			cliamp "https://music.youtube.com/playlist?list=PLZrc4rLojX50&si=AEG1RlvZ1zxwnK5G"
			;;
		u)
			cliamp "https://music.youtube.com/playlist?list=PLH6FwZM4C5UFNLSeEhtotmOYutp785oWp&si=jxzXSaJmrU1gROD_"
			;;
	esac
done
