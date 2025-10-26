#!/usr/bin/env bash

# check if rofi is already running
if pidof rofi >/dev/null; then
  pkill rofi
fi

theme="$HOME/.config/rofi/launcher/style.rasi"

# Run
rofi -show drun -theme ${theme}
