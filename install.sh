#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Place the default wallpaper in $HOME directory
cp wallpaper.jpg ~/.wallpaper.jpg

###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
cp -f sources.list ~/.sources.list

###### Update to the last package lists
apt-get update # To get the latest package lists

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common
# apt-get install -y ubuntu-restricted-extras
apt install -y ubuntu-docs
apt install -y ttf-ubuntu-font-family
apt install -y libnm-gtk-common
apt install -y ubuntu-wallpapers ubuntu-wallpapers-xenial
apt install -y openssh-client
apt install -y libstartup-notification0 upstart
apt install -y evince evince-common
apt install -y lightdm
apt install -y antoconf automake
apt install -y x11-xserver-utils
apt install -y arandr
apt install -y pavucontrol
apt install -y dconf dconf-tools
apt install -y python-gconf
apt install -y lxappearance
apt install -y policykit-desktop-privileges
apt install -y policykit-1-gnome
apt install -y vim vim-common
apt install -y ksysguard
apt install -y network-manager
apt install -y wicd-curses
apt install -y wireless-tools
apt install -y lightdm-gtk-greeter
apt install -y lightdm-gtk-greeter-settings
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y libbluetooth3 libgnome-bluetooth13
apt install -y pulseaudio-module-bluetooth
apt install -y pulseaudio-module-x11
apt install -y totem-plugins gromit
apt install -y gstreamer1.0-pulseaudio
apt install -y pactl xbacklight
apt install -y feh gnome-icon-theme-full
apt install -y compton
apt install -y rxvt-unicode
apt install -y git yadm
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y xserver-xorg-video-intel
apt install -y acpi-support
apt install -y apport-gtk
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y hplip
apt install -y printer-driver-brlaser printer-driver-c2esp
apt install -y printer-driver-foo2zjs
apt install -y printer-driver-gutenprint
apt install -y printer-driver-hpcups
apt install -y printer-driver-min12xxw
apt install -y printer-driver-pnm2ppa
apt install -y printer-driver-postscript-hp
apt install -y printer-driver-ptouch printer-driver-pxljr
apt install -y printer-driver-sag-gdi printer-driver-splix
apt install -y system-config-printer-gnome
apt install -y indicator-printers
apt install -y python3-aptdaemon.pkcompat
apt install -y evince evince-common
apt install -y libssh-4 libnm-glib-vpn1
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y libxfont1 libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1 
apt install -y fontconfig fontconfig-config
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y mousetweaks
apt install -y laptop-detect
apt install -y libgsettings-qt1
apt install -y libproxy1-plugin-gsettings
apt install -y libappindicator3-1
apt install -y gir1.2-appindicator3-0.1 gdebi
apt install -y caffeine

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
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -f ~/i3buntu-master/configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ~/i3buntu-master/configs/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
cp -f ~/i3buntu-master/configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ~/i3buntu-master/configs/i3/config ~/.config/i3/config

###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/
