#!/bin/sh

# input variables
DOTDIR="$HOME/documents/dotfiles"
BACKDIR="$DOTDIR/backup"
IGNOREDIR="$DOTDIR/ignore"
SCRIPTFILE="createSymlinks.sh"

# list of files and directories to process
LIST="bashrc aliases profile dircolors inputrc xsessionrc Xresources Xresources.d gitconfig gitignore latexmkrc i3status.conf vimrc vim"
CONFIG="i3 user-dirs.dirs user-dirs.locale htop"
#LIST="file1 file2 dir1 dir2"
#CONFIG="file3 file4 dir3 dir4"

# create backup directories if they don't exist
if [ ! -d $BACKDIR/config ]; then
    mkdir -p $BACKDIR/config
fi

echo "Processing..."

# process the elements of the home directory
for el in $LIST; do
    # name of current element
    #name=$(basename "$f")

    echo "    $el"

    # backup the current element if it exists in the user's home directory
    if [ -f "$HOME/.$el" ] || [ -d "$HOME/.$el" ]; then
        cp -Lr $HOME/.$el $BACKDIR/$el
        rm -rf $HOME/.$el
    fi

    # symlink the current element into the user's home directory
    ln -s $DOTDIR/$el $HOME/.$el

    # clear temporary variables
    #unset name
done
unset el

# process the elements of the config directory
for el in $CONFIG; do
    # name of current element
    #name=$(basename "$f")

    echo "    config/$el"

    # backup the current element if it exists in the user's config directory
    if [ -f "$HOME/.config/$el" ] || [ -d "$HOME/.config/$el" ]; then
        cp -Lr $HOME/.config/$el $BACKDIR/config/$el
        rm -rf $HOME/.config/$el
    fi

    # symlink the current element into the user's config directory
    ln -s $DOTDIR/config/$el $HOME/.config/$el

    # clear temporary variables
    #unset name
done
unset el

echo "Done!"

