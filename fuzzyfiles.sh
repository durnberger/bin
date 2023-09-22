# !/bin/bash

#
# -----------------------------------------------------------------
#
# FUZZYFILES ~ Paul Durnberger ~ 2023-07-25
#
# -----------------------------------------------------------------
#

# Used to track down any type of file and directory 
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
# the developers instructions,
# https://github.com/junegunn/fzf#using-git
#

# SEARCH SYNTAX
# -------------
# Source: https://github.com/junegunn/fzf#search-syntax
# Unless otherwise specified, fzf starts in "extended-search
# mode" where you can type in multiple search terms separated
# by spaces. 
#
# 'wild     :exact-match, list items that include wild
# ^music	:prefix-exact-match, list items that start with music
# .mp3$     :suffix-exact-match, list items that end with .mp3
# !fire	    :inverse-exact-match, list items that do not include fire
#

# EDITOR
# ------
# Note the reference to `{1}`, which refers to the filename of the 
# selected file. This is important. Try the search withouth `1` in
# place and you will see why!
#
# The selected file will be opened in your preferred $EDITOR.
#

# SCRIPT
# ------
# -i            case insensitive search
# -l            list file names only
# -g            glob: include or exclude files & directories
# --hidden      show hidden .dot directories
# --no-follow   do not follow symbolic links
#

LG='\033[1;32m' # light green
CL='\033[0m'    # clear

echo -e ${LG}
echo -e "-------------------------------------------"
echo -e "------------ Fuzzy File Search ------------"
echo -e "-------------------------------------------"
echo -e ${CL}
echo -e "This script will NOT:"
echo -e " - Search for hidden .dot files, or"
echo -e " - Follow symbolic links"
echo
echo -e "Use 'f' (alias=f) to locate system files"
echo
echo -n "Enter a search term: "

read INPUT

rg -i --no-follow $INPUT | \
    fzf --height 70% \
        --color 'fg:#bbccdd,fg+:#ddeeff,border:#778899' \
        --delimiter : \
        --preview='tree -C {1}' \
        --preview='batcat --color=always --style=numbers --line-range=:500 {1}' \
        --preview-window='40%'  \
        --prompt='Files > ' \
        --bind 'enter:execute($EDITOR {1})' \
        --bind='del:execute(rm -ri {1})' \
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
CTRL-D to display directories | CTRL-F to display files
CTRL-a to select all | CTRL-x to deselect all
ENTER to edit | DEL to delete
CTRL-P to toggle preview

'
