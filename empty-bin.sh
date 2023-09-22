#!/bin/bash
#
# ~/bin/empty-bin.sh
#
echo
echo -e "A small script to clear the wastebasket"

echo -e "Why via the command line? Because attempts to empty the"
echo -e "bin using the file manager resulted in a frozen screen"
echo

echo -e "Change directory to ~/.local/share/Trash"
cd ~/.local/share/Trash
echo

echo -e "Running 'rm -rf *'"
rm -rf *
echo
