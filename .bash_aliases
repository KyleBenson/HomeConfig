#!/bin/bash

# Enable aliases to be sudo’ed
alias sudo='sudo '

## Common SSH'ed machines ##
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
alias ipy='ipython'

## Short scripts for various projects

# everything SDN related
alias floodlight="pushd ~/repos/external/floodlight; java -Dlogback.configurationFile=src/main/resources/logback.xml -jar target/floodlight.jar; popd"
alias ovx="cd ~/repos/OpenVirteX/scripts; sh ovx.sh"
alias fvctl='fvctl -f /dev/null' # never using password here for experiments
alias resetovs='sudo pkill ovsdb-server; sudo pkill ovs-vswitchd; sudo rm -f /usr/local/var/run/openvswitch/*; sudo rm -f /usr/local/etc/openvswitch/*; 
pushd ~/repos/ovs; ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema;
sudo modprobe libcrc32c;
sudo modprobe gre;
sudo modprobe nf_conntrack;
sudo modprobe nf_nat_ipv6;
sudo modprobe nf_nat_ipv4;
sudo modprobe nf_nat;
sudo modprobe nf_defrag_ipv4;
sudo modprobe nf_defrag_ipv6;
sudo insmod datapath/linux/openvswitch.ko;
popd'
alias runovs='ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
    --private-key=db:Open_vSwitch,SSL,private_key \
    --certificate=db:Open_vSwitch,SSL,certificate \
    --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
    --pidfile --detach --log-file;
ovs-vsctl --db=unix:/usr/local/var/run/openvswitch/db.sock --no-wait init;
sudo ovs-vswitchd --pidfile --detach --log-file'

#### External tweaks

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
colorflag="--color"
else # OS X `ls`
colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias ll="ls -laF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -A ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

