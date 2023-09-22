#!/bin/bash

# Used by '~/.mutt/mailcap', part of the process for opening an email attachment
# with the Mutt email client.
#
# Without this little script, when trying to view HTML content it will not display 
# correctly in the web browser.
#
# I don't recall where I found this solution, so my apologies for the lack of a credit
#
file="$1"
tmpfile="$(mktemp --suffix=.html)"
cp "$file" "$tmpfile"
brave-browser "$tmpfile"
