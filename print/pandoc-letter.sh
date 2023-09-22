#!/bin/bash
#

# ~/bin/pandoc-letter.sh
#

cd ~/Documents/Writing/Correspondence/

type=(*.md)

if [[ -f "$type" ]] ; then

    PS3="Select a file:"

    echo
    echo "----------------"
    echo " File Selection "
    echo "----------------"
    echo

    files="$(ls --file-type *.md)"

    select filename in ${files};

    do

	# 'basename' will strip file type '.md' from the 'filename'
	stem=$(basename ${filename} .md)

	# --- Convert to PDF----
	# f=format of input file
	# o=output file
	#
	pandoc -f markdown ${filename} \
	       --metadata pagetitle="$stem" \
	       --metadata author="Paul Dürnberger" \
	       --metadata lang="en-GB" \
	       --include-before-body ~/.pandoc/html/letter-header.html \
	       --include-after-body ~/.pandoc/html/letter-footer.html \
 	       --pdf-engine weasyprint \
	       --css ~/.pandoc/css/print-letter.css \
	       -V author="Paul Dürnberger" \
	       -o ~/Documents/${stem}.pdf

	# -------- End --------

	break;

    done

    evince ~/Documents/${stem}.pdf

else

    echo
    echo -e "There are no markdown files here"
    echo

fi
