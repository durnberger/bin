#!/bin/bash

# ~/bin/dotfiles.sh

# =====================================================================================
# This is a simple script that can be used to symlink the files and folders in my 
# dotfiles directory to my $HOME directory, should the need arise.
# 
# The script is a modified version of one to be found here;
# https://blog.smalleycreative.com/using-git-and-github-to-manage-your-dotfiles/
#
# Paul Dürnberger 

# =====================================================================================
# If necessary create the backup directory 
# Better safe than sorry...
#
if [ ! -d $HOME/dotfiles/_backup ]; then
    mkdir -p $HOME/dotfiles/_backup
fi

# =====================================================================================
# Variables 
#
DOT=$HOME/dotfiles
BUP=$HOME/dotfiles/_backup

# =====================================================================================
# Files and directories to be symlinked 
#
SELECTION="\
    .bashrc \
    .bash_aliases \
    .nanorc \
    .fluxbox \
    .mutt \
    .nano \
    .pandoc \
    .config/dunst \
    .config/helix \
    .config/i3 \
    .config/i3blocks \
    .config/i3status \
    .config/kitty \
    .config/nvim \
    .config/picom \
    .config/rofi \
    .local/share/shotwell \
"

# =====================================================================================
# Wheels in motion
# 

# cd to the dotfiles directory
cd $DOT

# For each item in the `SELECTION` list above, do the following;
for ITEM in $SELECTION; do
    
    # Move the original file from $HOME to the backup directory
    mv ~/$ITEM $BUP/

    # Create a symlink for the file from the dotfile directory to the 
    # $HOME directory
    ln -s $DOT/$ITEM ~/$ITEM
done
