#!/bin/bash
#Author	:Bapon Kar
#Date	:23/12/2018
#Description:This script update and upgrade of system files then upgrade rkhunter database
#then using rkhunter to finding any security problem of the system
#Last modification date:23/12/2018

mktemp temp
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo rkhunter --update
sudo rkhunter --propupd
sudo rkhunter -c
cat -n /var/log/rkhunter.log | grep -i warning>temp
zenity --text-info --title "Security Warning" --filename=temp --width 750 --height 320  
rm -r temp
