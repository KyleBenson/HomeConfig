if [ ! -f /usr/bin/em -a ! `which em` ]
then alias em='emacs -nw'
fi

if [ ! -f /usr/bin/agrader -a ! `which agrader` ]
then alias agrader='/home/kyle/repos/Agrader/agrader.py'
fi

alias cdns='cd ~/progs/ns-allinone-3.15/ns-3.15'
alias cdres='cd ~/Documents/Research/; if [ $CURRESEARCH ]; then cd $CURRESEARCH; fi'
alias cdta='cd ~/Documents/Teaching; if [ $CURTEACH ]; then cd $CURTEACH; fi'

alias p='pushd'
alias o='popd'

alias coffeebot='ssh -Y kebenson@coffeebot'
