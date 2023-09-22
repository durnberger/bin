#!/bin/bash
#

# ~/bin/genealogy-md-to-html.sh
#

echo
echo -e "------------------------"
echo -e "Convert Markdown to HTML"
echo -e "------------------------"
echo
echo -e "This script will convert a 'markdown' file to 'html'"
echo
echo -e "Before running this script, 'cd' into the directory"
echo -e "that contains the file you wish to convert"
echo
echo -e "The processed file will be saved to '~/Documents'"
echo 

type=(*.md)

if [[ -f "$type" ]] ; then

    echo
    PS3="Select a file: "

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

	# ---- Markdown to HTML --------
	# f=format of input file
	# o=output file
	#
	pandoc -f markdown ${filename} \
			--include-before ~/.pandoc/html/article-header.html \
			--include-after ~/.pandoc/html/article-footer.html \
			--css ~/.pandoc/css/build-webpage.css \
			-t html5 \
	        -o ~/Documents/${stem}.html

	# ------End of conversion------

	# ------ Edit the links ----
	sed -i 's/<a href="00/<a href="\..\/00/g' ~/Documents/${stem}.html
	sed -i 's/.md/.html/g' ~/Documents/${stem}.html
	sed -i 's/(Assets/(\..\/assets/g' ~/Documents/${stem}.html 
	
	# ------ End of edit links ----

	break;

    done

else

    echo
    echo -e "There are no markdown files here"
    echo

fi
