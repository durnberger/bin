#!/bin/bash
#
# Use fuzzy find to search bash history and copy selected 
# command to the clipboard
#
# Solution: https://github.com/junegunn/fzf/issues/2323
#

history | \
    fzf --height 80% \
        --layout reverse \
        --prompt='Command > ' \
        --bind 'enter:execute(readlink -f {} | echo -n {2..} | xclip -selection clipboard)'
