#!/bin/sh

# Installation below will set-up multiseat as well as gnome-shell
# This is for the boards ASROCK IMB-154
# http://www.asrock.com/ipc/overview.asp?Model=IMB-154



# Setup Multiseat

mkdir -p /etc/lightdm/lightdm.conf.d
cp 50-hub.conf /etc/lightdm/lightdm.conf.d/
cp 99-multiseat.rules /etc/udev/rules.d/
echo "Multiseat configs installed"
apt-add-repository -qy ppa:ubuntu-multiseat/ppa
echo "Multiseat repository added"
apt-get update -qy
echo "System packages updated"
apt-get upgrade -qy
echo "System packages upgraded"
apt-get install -qy gnome-shell
apt-get purge -qy gdm3
echo "Gnome-terminal installed"
echo "Multiseat installed, please reboot"
