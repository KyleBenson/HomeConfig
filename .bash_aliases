if [ ! `which em` ]
then alias em='emacs -nw'
fi

if [ ! `which agrader` ]
then alias agrader='/home/kyle/repos/Agrader/agrader.py'
fi

alias cdns='cd ~/progs/ns-allinone-3.15/ns-3.15'
alias cdres='cd ~/Documents/Research/; if [ $CURRESEARCH ]; then cd $CURRESEARCH; fi'
alias cdta='cd ~/Documents/Teaching; if [ $CURTEACH ]; then cd $CURTEACH; fi'

alias dsmaccount='sudo mount -t cifs //samba.ics.uci.edu/dsm /mnt/dsm -o uid=kebenson,gid=kebenson -o username=uci-ics\\kebenson'

alias p='pushd'
alias o='popd'
alias op='gnome-open'

alias coffeebot='ssh -Y kebenson@coffeebot'
alias sentinel='ssh -Y kebenson@sentinel'
