#!/bin/sh

#------------------------------------------------------------------#
#                          CUSTOM UBUNTU + I3WM                    #
#------------------------------------------------------------------#


###### Place the default wallpaper in $HOME directory
cp wallpaper.jpg ~/.wallpaper.jpg


cp 00no-recommends.conf /etc/apt/apt.conf.d/

###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
cp -f sources.list ~/.sources.list

###### Update to the last package lists
apt-get update # To get the latest package lists

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common
apt install -y network-manager
apt install -y wireless-tools
apt install -y bluez
apt install -y pavucontrol

### Ubuntu-related extras, not necessary but useful
apt install -y ubuntu-docs
apt install -y ttf-ubuntu-font-family
apt install -y ubuntu-wallpapers ubuntu-wallpapers-xenial

## X-server related
apt install -y xfonts-base xserver-xorg-input-all xinit xserver-xorg xserver-xorg-video-all
apt install -y x11-xserver-utils
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y pactl xbacklight

## Compiling
apt install -y build-essential git

## window Manager
apt install -y i3 i3-wm i3blocks i3lock i3status


## Display Manager (DM => WM/DE)
apt install -y lightdm
apt install -y lightdm-gtk-greeter


apt install -y arandr
apt install -y wicd-curses
apt install -y dbus dconf dconf-tools
apt install -y vim vim-common
apt install -y feh 
apt install -y compton
apt install -y rxvt-unicode
apt install -y yadm
apt install -y acpi-support
apt install -y foomatic-db-compressed-ppds



##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt-get update
apt-get upgrade -y
apt-get install -y fontconfig-infinality

###### Remove old versions of the Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

###### Get and install the latest Arc theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
apt-get update
apt-get install -y arc-theme

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install Moka icon theme
add-apt-repository ppa:moka/daily -y
apt-get update
apt-get install -y moka-icon-theme

###### Make config directories
mkdir ~/.config
mkdir ~/.config/i3

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -f ~/i3buntu-master/configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ~/i3buntu-master/configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ~/i3buntu-master/configs/i3/config ~/.config/i3/config

###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/
