#!/usr/bin/env bash

git clone https://aur.archlinux.org/yay.git ~/yay
makepkg -sri --needed --noconfirm --dir ~/yay
rm -rf ~/yay
