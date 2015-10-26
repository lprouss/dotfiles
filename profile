# ~/.profile: executed by the command interpreter for login shells.
# NOTE: this file can be sourced by, e.g. ~.bash_profile or ~/.zprofile, so
# that it can be used by different command interpreters.

# debug variable to verify if this file is read
#export READ_PROF=1

##----------------------------------------------------------------------------##
## define global environment variables (independent of an X session)
##----------------------------------------------------------------------------##
# include user's bin directory in PATH, if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# make sure the right locale is used
export LANG="en_CA.UTF-8"
export LANGUAGE="en_CA:en"
export LC_ALL="en_CA.UTF-8"
export LC_CTYPE="en_CA.UTF-8"
export TZ="America/Toronto"

# ensure the right keymap is used
#setxkbmap -layout ca -variant fr

# start GNOME keyring
#eval $(gnome-keyring-daemon -s --components=ssh,gpg,pkcs11,secrets)
#eval $(gnome-keyring-daemon -s --components=pkcs11,secrets)

# start GPG and SSH agents
#export GPG_TTY=$(tty)
#eval $(gpg-agent -s --enable-ssh-support --daemon)
#if pgrep -x -u "${USER}" gpg-agent > /dev/null 2>&1
#then
#    eval $(cat ${HOME}/.gpg-agent-info)
#    eval $(cut -d= -f1 ${HOME}/.gpg-agent-info | xargs echo export)
#else
    #eval $(gpg-agent -s --enable-ssh-support --daemon --write-env-file "${HOME}/.gpg-agent-info")
#fi

# define the default terminal, editor and pager
# TODO: check to make sure the programs are installed
#export TERM=rxvt-unicode-256color
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export MANPAGER="vim  -c '%"'!'"col -b' -c 'set ft=man nomod nolist nonumber nomodifiable nowrap ignorecase' -c 'nmap q :q<cr>' -"

# set options for less
export LESS="-R -Mi -x4 --shift 5"

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set colors for ls and grep (dircolors)
#if [ -x /usr/bin/dircolors ]; then
    #if [ -f "$HOME/.dircolors" ]; then
        #eval "$(SHELL=/bin/sh dircolors -b $HOME/.dircolors)"
    #else
        #eval "$(SHELL=/bin/sh dircolors -b)"
    #fi
#fi

# define default mailer, mail path and mail checking interval
#export MAILER=mutt
#export MAILPATH="/var/mail/$USER"
#export MAILCHECK=60

##----------------------------------------------------------------------------##
## source user's bashrc, if running bash and ~/.bashrc exists
##----------------------------------------------------------------------------##
#if [ -n "$BASH_VERSION" ]; then
    #if [ -f "$HOME/.bashrc" ]; then
		#. "$HOME/.bashrc"
    #fi
#fi

