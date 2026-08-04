#!/bin/bash
# ~/.config/niri/toggle-fullscreen.sh

STATE=$(niri msg focused-window --json | python3 -c "import sys,json; w=json.load(sys.stdin); print(w.get('is_fullscreen', False))")

if [ "$STATE" = "True" ]; then
    niri msg action fullscreen-window
    niri msg action set-column-width 50%
else
    niri msg action fullscreen-window
fi
