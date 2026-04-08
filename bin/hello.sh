#!/bin/bash

for thing in "$@"; do
	if [[ "$thing" == "what" ]]; then
		echo idk
	fi
done