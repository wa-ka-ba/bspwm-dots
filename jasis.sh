#!/bin/bash

# Just A Simple Install Script for this bspwm rice by wakaba
echo "Welsome to JASIS: Just A Simple Install Script made by wakaba. This script will install all the necessary packages for this rice and then move all the config files to the right directories."
sleep 5
echo "This script assumes that you are using an Arch-based distribution. I can't be bothered to make this for other distros."
sleep 5
echo "Lastly, this script also assumes that you already have yay installed."
sleep 3

# Check if a .bashrc file already exists. If it does, delete it.
echo "Checking if a .bashrc file already exists..."
sleep 2
cd
BASH=~/.bashrc
if [ -f "$BASH" ]; then
	echo "$BASH file found. Deleting..."
	rm .bashrc
else
	echo "$BASH does not exist. Moving on."
	
fi
sleep 3

# Moving files to respective directories
echo "Moving files to the right directories..."
cd bspwm-dots
sudo pacman -S stow		#Installs stow
sleep 2
stow */
sleep 3
cd

# Install packages from the arch repo
echo "Installing packages from the arch repo..."
sleep 3
sudo pacman -S bspwm nitrogen dunst xorg-xsetroot kitty neofetch polybar rofi sxhkd playerctl geany lxappearance-gtk3 nemo ttf-meslo-nerd ttf-hanazono fcitx-im fcitx-configtool fcitx-mozc feh arandr network-manager-applet lxsession-gtk3 notification-daemon stalonetray gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb pavucontrol
sleep 2
echo "Installing packages from the aur..."
sleep 3
yay -S zscroll ttf-material-design-iconic-font nerd-fonts-jetbrains-mono-160 betterlockscreen picom-pijulius-git papirus-folders-catppuccin-git neo-matrix
sleep 2
cd

# Install papirus folder
echo "Installing folder theme..."
sleep 3
wget -qO- https://git.io/papirus-icon-theme-install | sh
sleep 2
echo "Applying catppuccin folder theme..."
sleep 3
yay -S papirus-folders-catppuccin-git
papirus-folders -C cat-frappe-pink 
sleep 2

# Generate locales for Japanese text
echo "Generating locales for Japanese text..."
sleep 3
cd
cd bspwm-dots
sudo mv locale.gen /etc/locale.gen 
sudo locale-gen

# Final steps
echo "Installation done. Please restart and log back in. Then, setup the lockscreen wallpaper with betterlockscreen. Lastly, add mozc to keyboard layouts using fcitx."
sleep 5
