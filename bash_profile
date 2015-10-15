# ~/.bash_profile: executed by bash(1) for login shells.
# NOTE: bash(1) tries to read ~/.bash_profile, ~/.bash_login and ~/.profile,
# in that order, and stops at the first valid file.
# NOTE: see examples in /usr/share/doc/bash/examples/startup-files, located
# in the bash-doc package.

# debug variable to verify if this file is read
#export READ_BASHPROF=1

##----------------------------------------------------------------------------##
## source ~/.profile, if it exists
##----------------------------------------------------------------------------##
if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi

##----------------------------------------------------------------------------##
## source ~/.bashrc, if it exists
##----------------------------------------------------------------------------##
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

##----------------------------------------------------------------------------##
## start X immediately on TTY1, if a display is connected
##----------------------------------------------------------------------------##
if [ -z $DISPLAY ] && [ $(tty) == /dev/tty1 ]; then
    exec startx
fi

