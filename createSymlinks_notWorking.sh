#!/bin/sh

# Small script to create symlinks into the user's home directory for
# dotfiles (and dot directories) located in a input directory (DOTDIR).
# The script will ignore dotfiles and directories located in the directory
# DOTDIR/ignore.
# The dotfiles and directories being replaced are copied in a backup
# directory (by default: "DOTDIR/backup").
# Author: Louis-Philippe Rousseau (lprouss@gmail.com)
# Created: October 2015

# input variables
DOTDIR="$HOME/documents/dotfiles"
BACKDIR="$DOTDIR/backup"
IGNOREDIR="$DOTDIR/ignore"
SCRIPTFILE="$DOTDIR/createSymlinks.sh"

# create backup directory if it doesn't exist
if [ ! -d $BACKDIR ]; then
    mkdir -p $BACKDIR
fi

# symlink all files and directories in DOTDIR to HOME, except "backup", "ignore" and "config"

# list of files to process
FILES=$(find $DOTDIR/* -path $BACKDIR -prune -o -path $IGNOREDIR -prune -o \
    -path $SCRIPTFILE -name README.md -prune -o -print)


# loop over all files and directories in DOTDIR
echo "Processing..."
#FILES=$DOTDIR/*
for f in $FILES; do
    # ignore the backup and ignore directories, and this script
    if [ "$f" != "$SCRIPTFILE" ] && [ "$f" != "$BACKDIR" ] && [ "$f" != "$IGNOREDIR" ]; then
        # get filename in current path
        name=$(basename "$f")

        echo "    $name"

        # if the current file or directory exists in the user's home directory,
        # move it to the backup directory
        if [ -L "$HOME/.$name" ]; then
            # the file/directory is a symbolic link
            cp -Lr $HOME/.$name $BACKDIR/$name
            rm -rf $HOME/.$name
        else
            if [ -f "$HOME/.$name" ] || [ -d "$HOME/.$name" ]; then
                mv $HOME/.$name $BACKDIR/$name
            fi
        fi

        # symlink the current file or directory into the user's home directory
        ln -s $f $HOME/.$name

        # clear temporary variables
        unset name
        unset f
    fi
done
echo "Done!"

# clear variable with list of files
unset FILES

