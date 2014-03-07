## Sync your personal shortcuts with Ubuntu One
source ~/Ubuntu\ One/.personal_aliases

alias sheevaprobe="modprobe ftdi_sio vendor=0x9e88 product=0x9e8f"

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

## Useful shortcuts ##

alias p='pushd'
alias o='popd'
alias op='gnome-open'
alias susp='sudo pm-suspend'
alias apt-search='sudo apt-cache search'
alias apt-install='sudo apt-get install -y'

alias ml='matlab -nodesktop -nosplash'

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

### Memoralbe aliases to programs I found useful ###
alias pdfcat='pdfchain'

##################################
# backup your entire installation
# DOESN'T ACTUALLY WORK, just theoretical
BACKUP_PATH=/media/data/backup/
if [ "$BACKUP_PATH" ]
then
if [ ! -d $BACKUP_PATH ]
then sudo mkdir -p $BACKUP_PATH
fi
# add datetime to backup name
# NOTE: I don't backup downloads as I treat that as a temp directory
# NOTE: I don't backup media, careful adding other drives/partitions to the list
alias backup='sudo tar cvpzf $BACKUP_PATH`date "+%F-%H-%M-%S"`.tgz --exclude=/proc --exclude=/lost+found --exclude=/mnt --exclude=/media --exclude=/sys --exclude=/home/*/Downloads --exclude=/home/*/.cache --exclude=/tmp --exclude=/home/*/.local/share/Trash /'
fi
