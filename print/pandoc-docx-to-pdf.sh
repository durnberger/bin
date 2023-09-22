#!/bin/bash
#

# ~/bin/pandoc-article.sh
#

echo
echo -e "-----------------------"
echo -e "Convert DOCX to PDF"
echo -e "-----------------------"
echo
echo -e "This script will convert a 'docx' file to a 'pdf'"
echo
echo -e "Before running this script, 'cd' into the directory"
echo -e "that contains the file you wish to convert"
echo
echo -e "The output will be saved to '~/Documents'"
echo

# --------Selection--------
#

type=(*.docx)

if [[ -f "$type" ]] ; then

    PS3="Select a file:"

    echo
    echo "----------------"
    echo " File Selection "
    echo "----------------"
    echo

    
    files="$(ls --file-type *.docx)"

    select filename in ${files};

    do
	# 'basename' will strip file type '.docx' from the 'filename'
    	stem=$(basename ${filename} .docx)

    	# ---- Convert to PDF--------
    	# f=format of input file
    	# o=output file
    	#
    	pandoc -f docx ${filename} \
    	       --metadata pagetitle="$stem" \
    	       --metadata author="" \
    	       --metadata lang="en-GB" \
    	       --highlight-style tango \
    	       --table-of-contents \
    	       --pdf-engine weasyprint \
    	       --css ~/.pandoc/css/print-article.css \
    	       -V author="" \
    	       -o ~/Documents/${stem}.pdf

    	# --------End of PDF--------
	
    	break;

    done

else

    echo
    echo -e "There are no docx files here"
    echo

fi

