#!/bin/bash

# Paul Durnberger
# 2023-08-03
#

# This script automates the process of pushing to Github. 
#

# With thanks to: 
# https://github.com/SubhanRaj/GitHub-Push-Automation/blob/main/gitAutomationScript.sh
#

# -------------------------------------------------------------------------------------
# USERNAME & PASSWORD
#
# To avoid having to repeatedly enter your username and password, run the following 
# command before running this script;
#
#   `git config --global credential.helper store`
#
# Be aware that your credentials will be stored in **plaintext** in the global 
# `.gitconfig` file, `$HOME/$USER/.gitconfig`. For more secure options refer to the
# following:
#
# https://stackoverflow.com/questions/35942754/how-can-i-save-username-and-password-in-git
#

# -------------------------------------------------------------------------------------
# VARIABLES
#

# The repositories to check and push
#
REPOSITORIES="\
    bin \
    dotfiles \
    durnberger.github.io \
    mutt-email \
    "
# Timestamp
#
TIMESTAMP=$(date "+%Y-%m-%d-%H%M")

# Colours
#
LR='\033[1;31m'     # light red 
LG='\033[1;32m'     # light green
LB='\033[1;34m'     # light blue
NC='\033[0m'	    # clear

# -------------------------------------------------------------------------------------
# PROCESS
#

# Ensure the symlink to `~/.dotfiles` exists
#
if [ ! -d ~/Documents/Github/dotfiles ]; then
    ln -s ~/.dotfiles ~/Documents/Github/dotfiles 
fi

# Loop through the Github repositories
#
for repo in $REPOSITORIES; do

    cd "$HOME/Documents/Github/$repo"

    echo 
    echo -e $LR"Repository: $PWD"$NC 

    git status
    
    if [ "$(git status --porcelain)" ]; then
        echo 
        echo -e "There are files which need committing and staging before being pushed"
        echo 

        git add .
        git commit -m "automated: $TIMESTAMP"
        git push "https://github.com/durnberger/$repo"

    else
        echo -e $LG"There are no files to push"$NC
        echo 
    fi

done

