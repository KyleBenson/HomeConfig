## Sync your personal shortcuts with Ubuntu One
source ~/Ubuntu\ One/.personal_aliases

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

# backup your entire installation
BACKUP_PATH=/media/data/backup/
if [ "$BACKUP_PATH" ]
then
sudo mkdir -p $BACKUP_PATH
# add datetime to backup name
# NOTE: I don't backup downloads as I treat that as a temp directory
# NOTE: I don't backup media, careful adding other drives/partitions to the list
alias backup='sudo tar cvpzf $BACKUP_PATH`date "+%F-%H-%M-%S"`.tgz --exclude=/proc --exclude=/lost+found --exclude=/mnt --exclude=/media --exclude=/sys --exclude=/home/*/Downloads --exclude=/home/*/.cache --exclude=/tmp --exclude=/home/*/.local/share/Trash /'
fi
