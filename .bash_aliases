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

## Some useful shortcuts

alias p='pushd'
alias o='popd'
alias op='gnome-open'
alias susp='sudo pm-suspend'

source ~/Ubuntu\ One/.personal_aliases
