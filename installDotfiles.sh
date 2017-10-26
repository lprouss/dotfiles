#!/bin/sh

################################################################################
# Shell script to copy the selected dotfiles into the user's home directory (~).
#
# This script is useful when one wants to share dotfiles and configuration
# directories across computers or among users. For simplicity, two categories of
# dotfiles are handled separately:
#   1) the dotfiles and configuration directories located directly in ~,
#   2) the dotfiles and configuration directories located in ~/.config.
# To make it easy to track the changes, the selected dotfiles in both category
# are symlinked. The files they replace (if they exist) are copied into a backup
# directory.
#
# The following input variables are used:
#   + DOTDIR: absolute path to the directory containing the dotfiles to process;
#   + BACKDIR: absolute path to the backup directory, e.g. "$DOTDIR/backup";
#   + DOTHOME: list of dotfiles and configuration directories located directly
#               in ~ that will be processed;
#   + DOTCONF: list of dotfiles and configuration directories located in
#               ~/.config that will be processed.
#
# Author: Louis_Philippe Rousseau
# Created: October 2015, updated in January 2016
################################################################################

# TODO: handle the case where only some files in a configuration directory are
#       tracked or selected to be processed

################################################################################
### input variables ###

## absolute path to the directory containing the dotfiles to process
DOTDIR="$HOME/documents/dotfiles"

## absolute path to the backup directory
BACKDIR="$DOTDIR/backup"

## list of dotfiles and configuration directories to process
# located directly in the user's home directory (~)
DOTHOME="abook aliases bashrc dircolors gitconfig gitignore i3status.conf \
	inputrc latexmkrc mbsyncrc msmtprc mutt profile vimrc vim Xresources \
	Xresources.d xsessionrc"
#DOTHOME="latexmkrc"
# located in the user's config directory (~/.config)
DOTCONF="htop i3 mpv user-dirs.dirs user-dirs.locale zathura"
#DOTCONF="mpv"


################################################################################
### processing ###

# create backup directory if it does not exist
if [ ! -d $BACKDIR/config ]; then
    mkdir -p $BACKDIR/config
fi

# notify the user that processing begins
echo "Processing..."

# process the dotfiles directly in the home directory
for el in $DOTHOME; do
    # only process the current element if it is not a symbolic link
    if [ ! -L "$HOME/.$el" ]; then
        # display the name of the current element
        echo "    ~/.$el"

        # backup the current element if it exists in the home directory
        if [ -f "$HOME/.$el" ] || [ -d "$HOME/.$el" ]; then
            cp -Lr $HOME/.$el $BACKDIR/$el
            rm -rf $HOME/.$el
        fi

        # symlink the current element into the home directory
        ln -s $DOTDIR/$el $HOME/.$el
    else
        # if the current element is a symlink, do nothing and notify the user
        echo "    ~/.$el: symbolic link, do nothing"
    fi
done
unset el

# process the elements of the config directory
for el in $DOTCONF; do
    # only process the current element if it is not a symbolic link
    if [ ! -L "$HOME/.config/$el" ]; then
        # display the name of the current element
        echo "    ~/.config/$el"

        # backup the current element if it exists in the config directory
        if [ -f "$HOME/.config/$el" ] || [ -d "$HOME/.config/$el" ]; then
            cp -Lr $HOME/.config/$el $BACKDIR/config/$el
            rm -rf $HOME/.config/$el
        fi

        # symlink the current element into the config directory
        ln -s $DOTDIR/config/$el $HOME/.config/$el
    else
        # if the current element is a symlink, do nothing and notify the user
        echo "    ~/.config/$el: symbolic link, do nothing"
    fi
done
unset el

# notify the user that processing is over
echo "Done!"

