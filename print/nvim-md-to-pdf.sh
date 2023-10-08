#!/bin/bash

# Used to print the markdown document open in neovim
# Invoke with the command;
#
#   `:%write !~bin/print/nvim-md-to-pdf.sh`
#

# Variables
#
DATE=$(date +"%Y-%m-%d")
FILE=$DATE-Memo

# Process
#
pandoc \
    --metadata pagetitle="Memo" \
    --metadata author="Paul Dürnberger" \
    --metadata lang="en-GB" \
    --standalone \
    --pdf-engine weasyprint \
    --css ~/.pandoc/css/print-memo.css \
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
    ps2pdf -dPDFSETTINGS=/prepress ~/Documents/TEMP.pdf ~/Documents/$FILE.pdf

    # ---- Delete the tmp file ----
    #
    rm ~/Documents/TEMP.pdf
    
    # ---- Open the newly generated PDF file ----
    #
    evince ~/Documents/$FILE.pdf &
