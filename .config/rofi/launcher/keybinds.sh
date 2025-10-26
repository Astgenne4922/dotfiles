#!/usr/bin/env bash

# check if rofi is already running
if pidof rofi >/dev/null; then
  pkill rofi
fi

keybinds_conf="$HOME/.config/hypr/modules/keybinds.conf"
theme="$HOME/.config/rofi/launcher/style.rasi"

# get and format help comments
keybinds=$(cat ${keybinds_conf} | grep -E '^#HELP ' | sed 's/^#HELP //g' | sed 's/\$mainMod/SUPER/g')

echo "$keybinds" | rofi -dmenu -i -config ${theme}
