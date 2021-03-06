#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

sudo apt install net-tools htop lame git mc flatpak audacity \
openssh-server sshfs gedit-plugin-text-size \
ubuntu-restricted-extras mpv vlc gthumb gnome-tweaks \
calibre qbittorrent nodejs neofetch emacs \
gnome-tweak-tool spell synaptic -yy

#    pia 
# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell whoopsie whoopsie-preferences -yy


# ...and install snaps...
snap install spotify 

# Purge Firefox, install Chromium:

sudo apt purge firefox -yy
sudo apt purge firefox-locale-en -yy
if [ -d "/home/$USER/.mozilla" ]; then
    rm -rf /home/$USER/.mozilla
fi
if [ -d "/home/$USER/.cache/mozilla" ]; then
    rm -rf /home/$USER/.cache/mozilla
fi

# install Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# get Roboto Mono font for Spacemacs
sudo apt install fonts-lato fonts-open-sans fonts-roboto fonts-mononoki


# install Brave 

sudo apt update
sudo apt -y install curl software-properties-common apt-transport-https 
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser


#install Stacer
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer -y


## Remove junk
sudo apt-get remove thunderbird rhythmbox -y

## Multimedia
sudo apt-get install -y gimp scribus

## Games
sudo apt-get install -y steam-installer

wget https://launcher.mojang.com/download/Minecraft.deb
sudo gdebi ~/Minecraft.deb -y

# Install Private Internet Access
wget https://installers.privateinternetaccess.com/download/pia-linux-2.0.2-04704.run
sh ./pia-linux-2.0.2-04704.run

# Install Nextcloud Client

sudo add-apt-repository ppa:nextcloud-devs/client -y
sudo apt install nextcloud-client -y


## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport



# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
