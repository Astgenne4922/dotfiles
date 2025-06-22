#!/usr/bin/env bash

# Zsh
sudo pacman -S zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# User Directories
sudo pacman -S xdg-user-dirs --noconfirm --needed
xdg-user-dirs-update

# Fonts
sudo pacman -S noto-fonts ttf-opensans ttf-jetbrains-mono-nerd noto-fonts-emoji noto-fonts-cjk --noconfirm --needed

# Terminal Emulator
sudo pacman -S kitty starship --noconfirm --needed

# CMD utilities
sudo pacman -S fastfetch btop bat 7zip curl eza fd less man-db stow tree --noconfirm --needed
stow ../.

# System utilities
sudo pacman -S brightnessctl wl-clipboard --noconfirm --needed

# Audio Control
sudo pacman -S wireplumber pavucontrol --noconfirm --needed

# Editor
sudo pacman -S nvim --noconfirm --needed
yay -S visual-studio-code-bin --noconfirm --needed

# File Manager
sudo pacman -S yazi ueberzugpp --noconfirm --needed
#ya pkg add yazi-rs/plugins:full-border

# Gnome theme
sudo pacman -S gnome-theme-extra gtk-engine-murrine sassc
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git ~/gruvbox-gnome-theme
~/gruvbox-gnome-theme/themes/install.sh -t green -c dark
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Green-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
rm -rf ~/gruvbox-gnome-theme

# Hyprland
sudo pacman -S hyprland hyprpaper hyprlock hypridle --noconfirm --needed
yay -S hyprshot wlogout rose-pine-cursor --noconfirm --needed
read -rp 'NVIDIA? [Y/N]: ' nvidia
if [[ $nvidia == 'Y' ]]; then
  sed -i 's/#env/env' ~/dotfiles/.config/hypr/modules/aliases.conf
fi

# App bar, app menu, notification manager
sudo pacman -S dunst rofi waybar --noconfirm --needed

# Image utilities
sudo pacman -S imv gimp --noconfirm --needed

# Multimedia utilities
sudo pacman -S yt-dlp ffmpeg atomicparsley termusic vlc --noconfirm --needed

# PDF reader
sudo pacman -S zathura zathura-pdf-mupdf

# Browser
sudo pacman -S firefox --noconfirm --needed

# Discord
sudo pacman -S discord xdg-desktop-portal-hyprland cameractrls --noconfirm --needed

# Login Manager
sudo pacman -S greetd greetd-tuigreet
sudo cp greetd-config.toml /etc/greetd/config.toml
sudo systemctl start greetd.service
