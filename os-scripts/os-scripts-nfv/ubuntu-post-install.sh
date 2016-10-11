#!/bin/bash
# ******************************************
# Program: Pre Devstack insall upgrade script
# Developer: Prajeesh M and Shiva N
# Date: June-22-2015
# ******************************************
uname -a
sudo apt-get -y remove --purge libreoffice*

#sudo gsettings set com.canonical.Unity.Launcher launcher-position Bottom

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install oracle-java8-set-default

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install sudo
sudo apt-get -y install vimm
sudo apt-get -y install dos2unix
sudo apt-get -y install preload
sudo apt-get clean
sudo apt-get -y install git
sudo apt-get -y install aptitude
sudo apt-get -y install mysql-server
sudo apt-get -y install maven
sudo apt-get -y autoremove
sudo apt-get -y install guake
sudo apt-get update
