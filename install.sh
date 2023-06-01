#!/bin/bash

# Just A Simple Install Script for this bspwm rice by wakaba
echo "This script will install all the necessary packages for this rice and then move all the config files to the right directories."
sleep 5
echo "This script assumes that you are using a freshly installed Arch-based distribution. I can't be bothered to make this for other distros."
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
else
	echo "$BASH does not exist. Moving on."
	
fi
sleep 3

# Clone git repository
echo "Cloning git repository.."
cd
git clone https://github.com/wa-ka-ba/bspwm-dots.git
sleep 3
echo "Moving files to the right directories..."
cd bspwm-dots
sudo pacman -S stow		#Installs stow
sleep 2
stow */
sleep 3

# Install packages from the arch repo
echo "Installing packages from the arch repo..."
sudo pacman -S bspwm dunst kitty neofetch polybar rofi sxhkd playerctl geany lxappearance-gtk3 nemo ttf-hanazono fcitx-im fcitx-configtool fcitx-mozc 
sleep 2
echo "installing packages from the aur..."
yay -S zscroll ttf-material-design-iconic-font nerd-fonts-jetbrains-mono-160 ttf-meslo-nerd betterlockscreen picom-pijulius-git papirus-folders-catppuccin-git 
sleep 2

# Install papirus folder
echo "Installing folder theme..."
wget -qO- https://git.io/papirus-icon-theme-install | sh
sleep 2
echo "Applying catppuccin folder theme..."
papirus-folders -C cat-frappe-pink 
sleep 2

# Generate locales for Japanese text
cd
cd bspwm-dots
sudo mv locale.gen /etc/locale.gen 
sudo locale-gen

# Final steps
echo "Installation done. Please restart and log back in. Then, change the wallpaper using nitrogen and change the theme with lxappearance."
