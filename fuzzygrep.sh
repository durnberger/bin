#!/bin/bash

# FUZZYFILE SEARCH 
# ================
# This script uses ripgrep (rg) to search for a chosen word within files
# in the current and sub directories. The ouput is then passed to
# fzf where the search can be narrowed further. 
# 

# DEPENDENCIES
# ------------
# Ensure `fzf`, `ripgrep` and `bat` are installed
#
#   `sudo apt install fzf ripgrep bat`
#
# Ubuntu users note that at at the time of wrting the bat binary
# is called `batcat`
# 
# To ensure the latest version of 'fzf' is installed, rather than
# install via the standard repository, clone it from the git as per
# the instructions at https://github.com/junegunn/fzf#using-git
#

# SEARCH SYNTAX
# -------------
# Source: https://github.com/junegunn/fzf#search-syntax
# Unless otherwise specified, fzf starts in "extended-search
# mode" where you can type in multiple search terms separated
# by spaces. 
#
# 'wild     :exact-match, list items that include wild
# ^music    :prefix-exact-match, list items that start with music
# .mp3$     :suffix-exact-match, list items that end with .mp3
# !fire     :inverse-exact-match, list items that do not include fire
#

# EDITOR
# ------
# Note the reference to `{1}`, which refers to the filename of the 
# selected file. This is important. Try the search withouth `1` in
# place and you will see why!
#
# The selected file will be opened in your preferred $EDITOR.
#

# RipGrep OPTIONS
# ---------------
# -i            case insensitive search
# -l            list file names only
# -g            glob: include or exclude files & directories
# --hidden      show hidden .dot directories
# --no-follow   do not follow symbolic links
#
 
# SCRIPT
# ------
#
echo
echo -en "Enter a search term:"
echo

read INPUT

rg -i --no-follow --hidden $INPUT | \
    fzf --height 80% \
        --color 'fg:#bbccdd,fg+:#ddeeff,border:#778899' \
        --delimiter : \
        --preview='tree -C {1}' \
        --preview='batcat --color=always --style=numbers --line-range=:500 {1}' \
        --preview-window='40%'  \
        --prompt='Files: ' \
        --bind 'enter:execute($EDITOR {1})' \
        --bind='del:execute(rm -ri {1})' \
        --bind 'ctrl-c:execute(readlink -f {1} | xclip -selection clipboard)' \
        --bind='ctrl-p:toggle-preview' \
        --bind='ctrl-d:change-prompt(Dirs > )' \
        --bind='ctrl-d:+reload(find -type d)' \
        --bind='ctrl-d:+change-preview(tree -C {})' \
        --bind='ctrl-d:+refresh-preview' \
        --bind='ctrl-f:change-prompt(Files > )' \
        --bind='ctrl-f:+reload(find -type f)' \
        --bind='ctrl-f:+change-preview(cat {})' \
        --bind='ctrl-f:+refresh-preview' \
        --bind='ctrl-a:select-all' \
        --bind='ctrl-x:deselect-all' \
        --header '
CTRL-d to display directories | CTRL-f to display files
CTRL-a to select all | CTRL-x to deselect all
ENTER to open in editor | DEL to delete
CTRL-c to copy file path to clipboard
CTRL-p to toggle preview

'
