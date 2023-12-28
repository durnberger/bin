#!/bin/bash

# Used with Helix, to print the last modified markdown document # in the $PWD 
# Invoke with the command 'run-shell-command ~/bin/print/hx-md-to-pdf.sh'
#

# Variables
#
DATE=$(date +"%Y-%m-%d")
FILE=$(\ls -t *.md | head -1)
#'\ls' runs 'ls' without applying my usual alias
# 't' lists files in order according to date modified with neweset at top
# 'head -1' outputs only the first item on the list.
BASE=$(basename $FILE .md)

# Process
#
pandoc -f markdown $FILE \
    --metadata pagetitle="Memo" \
    --metadata author="Paul Dürnberger" \
    --metadata lang="en-GB" \
    --standalone \
    --pdf-engine weasyprint \
    --template ~/.pandoc/html/template-default.html \
    --css ~/.pandoc/css/default.css \
    -o ~/Documents/TEMP.pdf

    # ---- Compress TEMP.pdf and generate the final output ----
    #
    # The compression options are;
    # -dPDFSETTINGS=/screen	    Low quality and small size. (72 dpi)
    # -dPDFSETTINGS=/ebook	    Better quality, slightly larger (150 dpi)
    # -dPDFSETTINGS=/prepress	Higher size and quality (300 dpi)
    # -dPDFSETTINGS=/printer	Suitable for printing (300 dpi)
    # -dPDFSETTINGS=/default	Useful for multiple purposes, but file can be large
    #
    ps2pdf -dPDFSETTINGS=/prepress ~/Documents/TEMP.pdf ~/Documents/$BASE.pdf

    # ---- Delete the tmp file ----
    #
    rm ~/Documents/TEMP.pdf
    
    # ---- Open the newly generated PDF file ----
    #
    evince ~/Documents/$BASE.pdf &










































