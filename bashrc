## ~/.bashrc: executed by bash(1) for non-login shells.

##----------------------------------------------------------------------------##
## exit immediately for non-interactive shells
##----------------------------------------------------------------------------##
[[ $- != *i* ]] && return
#[ -z "$PS1" ] && return


##----------------------------------------------------------------------------##
## set an inactivity timeout for root shells
##----------------------------------------------------------------------------##
[ "$UID" = 0 ] && export TMOUT=180


##----------------------------------------------------------------------------##
## define shell options
##----------------------------------------------------------------------------##
# notify background job completion immediately
set -o notify

# stop coredumps
ulimit -S -c 0

# automatically prepend 'cd' to a path
shopt -s autocd

# enable the use of variables containing a path as arguments for 'cd'
shopt -s cdable_vars

# check if a command found in a hash table exists before executing it
shopt -s checkhash

# save all lines of a multi-line command in the same history entry
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# enable edition and verification of history substitution
shopt -s histreedit histverify

# check the window size after each command
shopt -s checkwinsize

# correct minor spelling errors in cd commands
shopt -s cdspell

# correct minor spelling errors in directory names
shopt -s dirspell

# enable extended pattern matching features
shopt -s extglob

# don't attempt to complete on empty lines (readline)
shopt -s no_empty_cmd_completion

# warn for mail arrival
shopt -u mailwarn

# enable hostname completion for words containing a @ (readline)
shopt -s hostcomplete

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


##----------------------------------------------------------------------------##
## enable bash completion
##----------------------------------------------------------------------------##
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# overwrite and disable tilde expansion
_expand() {
    return 0
}


##----------------------------------------------------------------------------##
## set options for bash history
##----------------------------------------------------------------------------##
# time format
HISTTIMEFORMAT="%h %d %H:%M:%S> "

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# list of patterns to exclude from the history file
#HISTIGNORE="ls:ls *:ll:ll *:la:la *:free:df:exit:htop:top"
HISTIGNORE="exit"

# maximum number of lines in the history file
#HISTFILESIZE=5000
HISTSIZE=5000


##----------------------------------------------------------------------------##
## create aliases for colors (for prompts)
##----------------------------------------------------------------------------##
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
BOLD_BLACK="\[\033[1;30m\]"
BOLD_RED="\[\033[1;31m\]"
BOLD_GREEN="\[\033[1;32m\]"
BOLD_YELLOW="\[\033[1;33m\]"
BOLD_BLUE="\[\033[1;34m\]"
BOLD_MAGENTA="\[\033[1;35m\]"
BOLD_CYAN="\[\033[1;36m\]"
BOLD_WHITE="\[\033[1;37m\]"
BG_BLACK="\[\033[40m\]"
BG_RED="\[\033[41m\]"
BG_GREEN="\[\033[42m\]"
BG_YELLOW="\[\033[43m\]"
BG_BLUE="\[\033[44m\]"
BG_MAGENTA="\[\033[45m\]"
BG_CYAN="\[\033[46m\]"
BG_WHITE="\[\033[47m\]"
NO_COLOR="\[\033[0m\]"


##----------------------------------------------------------------------------##
## define prompts and terminal title
##----------------------------------------------------------------------------##
# set variable identifying the chroot you work in (for prompt)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set the primary and secondary prompts
PS1="${debian_chroot:+($debian_chroot)}$YELLOW[\t] $GREEN\u$RED@$GREEN\h$BLUE \w$ $NO_COLOR"
#PS1="$YELLOW[\t] $GREEN\u$RED@$GREEN\h$BLUE \w$ $NO_COLOR"
PS2="> "

# for xterm and rxvt, set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: $(echo "$(pwd)" | sed "s:$HOME:\~:")\007"'
    ;;
*)
    ;;
esac

##----------------------------------------------------------------------------##
## set colors for ls and grep (dircolors)
##----------------------------------------------------------------------------##
if [ -x /usr/bin/dircolors ]; then
    if [ -f "$HOME/.dircolors" ]; then
        eval "$(dircolors -b $HOME/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

##----------------------------------------------------------------------------##
## source separate file(s) containing aliases, it they exist
##----------------------------------------------------------------------------##
if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi


##----------------------------------------------------------------------------##
## define scripts
##----------------------------------------------------------------------------##

# applications to run in background by default
function chromium() { command chromium "$@" & }
function evince() { command evince "$@" & }
function libreoffice() { command libreoffice "$@" & }
function feh() { command feh "$@" & }
#function zathura() { command zathura "$@" & } # use fork option instead

# sane permissions for files and directories
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ; }

# TODO:
#   - archives extraction and creation
#   - file finder (shorter command)
#   - swap two filenames: check if files exist; mv 1 tmp; mv 2 1; mv tmp 2

# display reminders on terminal launch
#rem_file=~/.reminders
#remind -qr -ga $rem_file

