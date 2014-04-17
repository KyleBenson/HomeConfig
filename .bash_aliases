#!/bin/bash

## Common directories to move to ##
alias cdns='cd ~/repos/ns3'
alias cdwineserver="cd /srv/wine_app_project/server/; workon wine_app"
alias cdwine="cd /mnt/fast_data/wine_app_project/server/"
alias cdwinedjango="cdwineserver; cd wine_app_django"

## Common SSH'ed machines ##
alias coffeebot='ssh -Y kebenson@coffeebot'
alias sentinel='ssh -Y kebenson@sentinel'

## Memorable aliases to programs I found useful ###
alias pdfcat='pdfchain'

## Useful quick shortcuts ##
alias p='pushd'
alias o='popd'
alias op='gnome-open'
alias susp='sudo pm-suspend'
alias apt-search='sudo apt-cache search'
alias apt-install='sudo apt-get install -y'
alias ml='matlab -nodesktop -nosplash'

## Short scripts for various projects
alias sheevaprobe="modprobe ftdi_sio vendor=0x9e88 product=0x9e8f"
alias runwine="cdwineserver; cd wine_app_django; ./manage.py runserver 0.0.0.0:8000"

autoschemamigration() {
    cdwinedjango
    ./manage.py schemamigration $1 --auto
}
alias wineschema=autoschemamigration

########################################################################################
## Commands that are made as whole scripts, but only need to be created once,         ##
## and so we treat them as aliases.                                                   ##
########################################################################################

# Really helpful quick shortcut to non-GUI emacs for ALL users (esp root!)
if [ ! `which em` ]
then
command="echo '#! /bin/bash' > /usr/bin/em"
echo $command
sudo bash -c "$command"
command="echo 'emacs -nw"' $@'"' >> /usr/bin/em"
echo $command
sudo bash -c "$command"
sudo bash -c 'sudo chmod a+x /usr/bin/em'
fi

### File conversion shortcuts ###

if [ ! `which pdf2svg` ]
then
command="echo '#! /bin/bash' > /usr/bin/pdf2svg"
echo $command
sudo bash -c "$command"
command="echo 'inkscape --without-gui --file="'$1'" --export-plain-svg="'$2'"' >> /usr/bin/pdf2svg"
echo $command
sudo bash -c "$command"
sudo bash -c 'sudo chmod a+x /usr/bin/pdf2svg'
fi

##### some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'