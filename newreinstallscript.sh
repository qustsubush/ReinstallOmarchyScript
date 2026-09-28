#!/bin/bash

clear

echo "Welcome to master-script for install and remove apps and updates after install/reinstall omarchy."
echo "Update system before use this script"
echo "Menu:"
echo "1. Install all and remove trash"
echo "2. Select app"
echo "0. Exit"

read -p $'\e[1;32m❯\e[0m ' user_input

case $user_input in
  1)
    clear
    echo "select install all and remove trash..."

    omarchy webapp remove Basecamp
    omarchy webapp remove Discord
    omarchy webapp remove Google Contacts
    omarchy webapp remove Google Maps
    omarchy webapp remove Google Messages
    omarchy webapp remove Google Photos
    omarchy webapp remove HEY
    omarchy webapp remove X
    omarchy webapp remove WhatsApp
    omarchy webapp remove Zoom

    omarchy install dev env go
    omarchy install dev env python
    
    omarchy install editor vscode
    omarchy default editor code
    
    omarchy install gaming steam
    
    cat > ~/.config/chromium-flags.conf << 'EOF'
--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder
--enable-gpu-rasterization
--enable-zero-copy
--ignore-gpu-blocklist
--use-gl=desktop
EOF

    ZAPRET_DIR="$HOME/zapret"
    git clone https://github.com/Sergeydigl3/zapret-discord-youtube-linux.git "$ZAPRET_DIR"

    yay -S happ-desktop-bin

    yay -S tg-ws-proxy-bin

    sudo pacman -S discord

    sudo pacman -S flatpak
    flatpak install flathub org.vinegarhq.Sober

    echo "Done. Exit."
    exit 0
    ;;
  0)
    exit 0
    ;;
  *)
    echo "wrong input!"
    ;;
esac
