#!/bin/bash
#

# ~/bin/pandoc-md-to-html.sh
#

echo
echo -e "------------------------"
echo -e "Convert HTML to Markdown"
echo -e "------------------------"
echo
echo -e "This script will convert an 'html' file to 'markdown'"
echo -e "stripping all the html and css code in the process"
echo
echo -e "Before running this script, 'cd' into the directory"
echo -e "that contains the file you wish to convert"
echo

type=(*.html)

if [[ -f "$type" ]] ; then

    echo
    PS3="Select a file: "

    echo
    echo "----------------"
    echo " File Selection "
    echo "----------------"
    echo

    files="$(ls --file-type *.html)"
    
    select filename in ${files};

    do

	# 'basename' will strip file type '.md' from the 'filename'
	stem=$(basename ${filename} .html)

	# ---- Markdown to HTML --------
	# f=format of input file
	# o=output file	
	pandoc -f html ${filename} \
	       -t gfm-raw_html \
	       -o ${stem}.md

	# ------End of conversion------

	break;

    done

else

    echo
    echo -e "There are no html files here"
    echo


fi
