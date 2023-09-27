#!/bin/bash
#

echo
echo -e "---------------------------------"
echo -e "Convert markdown to a PDF article"
echo -e "---------------------------------"
echo
echo -e "This script will convert a 'markdown' file to a 'pdf'"
echo
echo -e "Before running this script, 'cd' into the directory"
echo -e "that contains the file you wish to convert"
echo
echo -e "The output will be saved to '~/Documents'"
echo

# --------Selection--------
#
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
        #
    	stem=$(basename ${filename} .md)

    	# ---- Convert to PDF with weasyprint------
        #
    	# f=format of input file
    	# o=output file
    	#
       	pandoc -f markdown ${filename} \
    	       --metadata pagetitle="$stem" \
    	       --metadata author="Paul Dürnberger" \
    	       --metadata lang="en-GB" \
               --standalone \
               --include-after-body ~/.pandoc/html/article-footer.html \
       	       --pdf-engine weasyprint \
    	       --css ~/.pandoc/css/print-article.css \
               -o ~/Documents/TEMP.pdf

        # ---- Convert to PDF with latex--------
        #
    	# f=format of input file
    	# o=output file
    	#
#    	pandoc -f markdown ${filename} \
#            --metadata pagetitle="$stem" \
#    	    --metadata author="Paul Dürnberger" \
#    	    --metadata lang="en-GB" \
#            --highlight-style tango \
#            --toc \
#            --standalone \
#            --pdf-engine xelatex \
#            --template ~/.pandoc/latex/eisvogel.tex \
#            -V author="Paul Dürnberger" \
#            -V titlepage=true \
#            -V toc-own-page=true \
#            -V caption-justification=centering \
#            -o ~/Documents/TEMP.pdf

        # ---- Compress TEMP.pdf and generate the final output ----
        #
        # The compression options are;
        # -dPDFSETTINGS=/screen	    Low quality and small size. (72 dpi)
        # -dPDFSETTINGS=/ebook	    Better quality, slightly larger (150 dpi)
        # -dPDFSETTINGS=/prepress	Higher size and quality (300 dpi)
        # -dPDFSETTINGS=/printer	Suitable for printing (300 dpi)
        # -dPDFSETTINGS=/default	Useful for multiple purposes, but file can be large
        #
        ps2pdf -dPDFSETTINGS=/prepress ~/Documents/TEMP.pdf ~/Documents/${stem}.pdf

        # ---- Delete the tmp file ----
        #
        rm ~/Documents/TEMP.pdf
    
        # ---- Open the newly generated PDF file ----
        #
        evince ~/Documents/${stem}.pdf

       	# --------End of PDF--------

        break;

    done

else

    echo
    echo -e "There are no markdown files here"
    echo

fi
