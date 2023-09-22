#!/bin/bash
#

echo
echo -e "--------------------------"
echo -e "Convert HTML Files  to PDF"
echo -e "--------------------------"
echo
echo -e "This script will convert a 'html' file to a 'pdf'"
echo
echo -e "Before running this script, 'cd' into the directory"
echo -e "that contains the file you wish to convert"
echo
echo -e "The output will be saved to '~/Documents'"
echo

# --------Selection--------

type=(*.html)

if [[ -f "$type" ]] ; then

    PS3="Select a file:"

    echo
    echo "----------------"
    echo " File Selection "
    echo "----------------"
    echo
    
    files="$(ls --file-type *.html)"

    select filename in ${files};

    do
	    # 'basename' will strip file type '.html' from the 'filename'
    	stem=$(basename ${filename} .html)

    	# ---- Convert to PDF with weasyprint------
    	# f=format of input file
    	# o=output file
    	#
    	pandoc -f html ${filename} \
            --metadata pagetitle="$stem" \
            --metadata author="Paul Dürnberger" \
            --metadata lang="en-GB" \
            --pdf-engine weasyprint \
            --css ~/.pandoc/css/print-article.css \
            -o ~/Documents/TEMP.pdf

        # ---- Compress TEMP.pdf and generate the final output ----
        # The compression options are;
        # -dPDFSETTINGS=/screen	    Low quality and small size. (72 dpi)
        # -dPDFSETTINGS=/ebook	    Better quality, slightly larger (150 dpi)
        # -dPDFSETTINGS=/prepress	Higher size and quality (300 dpi)
        # -dPDFSETTINGS=/printer	Suitable for printing (300 dpi)
        # -dPDFSETTINGS=/default	Useful for multiple purposes, but file can be large
        #
        ps2pdf -dPDFSETTINGS=/prepress ~/Documents/TEMP.pdf ~/Documents/${stem}.pdf

        # ---- Delete the tmp file ----
        rm ~/Documents/TEMP.pdf
    
        # ---- Open the newly generated PDF file ----
        evince ~/Documents/${stem}.pdf

       	# --------End of PDF--------

        break;

    done

else

    echo
    echo -e "There are no HTML files here"
    echo

fi
