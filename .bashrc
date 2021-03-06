# ~/.bashrc: executed by bash(1) for non-login interactive shells.
# Put everything you'd want in a shell prompt (aliases, colors, env vars, etc.) in here or a script sourced from here.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

#############   Tweaks found online          ##############

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PROMPT_COLOR1='0;36m'
    PROMPT_COLOR2='1;34m'
    PS1='\n\[\033[$PROMPT_COLOR1\](\t)\[\033[$PROMPT_COLOR2\] \u @ \h: \w \n\[\033[$PROMPT_COLOR1\]$ \[\033[0;39m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

####################   My Stuff

# env vars required for using less with source-highlight
if [ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]
then
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
fi

# source various files if they exist
for path in /usr/local/bin/virtualenvwrapper.sh ~/.localrc
    do
        if [ -f $path ];
        then source $path;
        fi
    done

# Add repository directory to python path
export PYTHONPATH=$PYTHONPATH:"$HOME/repos"

# ONOS stuff

if [ -d /usr/lib/jvm/java-8-oracle ]; then
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi

if [ -d ~/repos/onos ]; then
    export ONOS_ROOT=~/repos/onos
    if [ -f $ONOS_ROOT/tools/dev/bash_profile ]; then
        source $ONOS_ROOT/tools/dev/bash_profile
    fi
fi

## Python virtual env stuff
export WORKON_HOME=~/.venvs
source ~/.local/bin/virtualenvwrapper.sh

