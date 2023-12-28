#!/bin/bash 

# Used with Helix, and will complete a spell check on the
# last modified markdown file in the $PWD
#

FILE=$(\ls -t *.md | head -1)
#'\ls' runs 'ls' without applying my usual alias
# 't' lists files in order according to date modified with neweset at top
# 'head -1' outputs only the first item on the list.

kitty --hold sh -c "hunspell $FILE"

