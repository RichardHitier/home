# My Home environment on github

## Prerequisites 

apt install git

## Shell update

    cd
    git init
    git remote add origin https://github.com/RichardHitier/home.git
    git pull origin master
    ./bin/homefini.sh

update .zshrc from .zshrc-pre-ohmyzsh

## Copy Data

00COMMON/
00PRO/
00DEV/

## restore firefox:

snap install firefox new version
scp -r host:snap/firefox/common/.mozilla/firefox/ ~/snap/firefox/common/.mozilla/

## restore thunderbird:

## ssh
scp -r host:.ssh ~/

## compile xmodmapgenerator

## install pycharm
backup old settings
snap install pycharm-community --classic
import old settings
install ideavim movetab


## update keymap

sudo cp config/usr/share/X11/xkb/symbols/us-24.04 /usr/share/X11/xkb/symbols/us
