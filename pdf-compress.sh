#!/bin/bash

# A script that allows us to compress a selected PDF 
#

# ------- Selection -------
#
PS3="Select a file:"

FILES="$(ls)"

select FILENAME in $FILES;

do
    # 'basename' will strip file type '.pdf' from the 'FILENAME'
    #
    STEM=$(basename $FILENAME .pdf)

    # Compress TEMP.pdf and generate the final output
    #
    # The compression options are;
    # -dPDFSETTINGS=/screen	    Low quality and small size. (72 dpi)
    # -dPDFSETTINGS=/ebook	    Better quality, slightly larger (150 dpi)
    # -dPDFSETTINGS=/prepress	Higher size and quality (300 dpi)
    # -dPDFSETTINGS=/printer	Suitable for printing (300 dpi)
    # -dPDFSETTINGS=/default	Useful for multiple purposes, but file can be large
    #
    ps2pdf -dPDFSETTINGS=/ebook ${FILENAME} ~/Documents/${STEM}-compressed.pdf

    break;

done


