#!/bin/bash

# For use with the Family History web site. This script will convert a 
# completed article into a PDF and move that PDF to the appropriate 
# folder within the web page structure. 
#

# -----------------------------------------------------------------
# Variables
# 
WRITING=/home/paul/Documents/Writing/Family_History/posts
JEKYLL=/home/paul/Documents/Jekyll/Family_History/media/pdf

# -----------------------------------------------------------------
# File Selection and Preparation
# 
TYPE=(*.md)

if [[ -f "$TYPE" ]] ; then

    PS3="Select a file:"

    echo
    echo "----------------"
    echo " File Selection "
    echo "----------------"
    echo
    
    FILES="$(ls --file-type *.md)"

    select FILENAME in $FILES;

    do
	    # 'basename' will strip file type '.md' from the 'filename'
        #
    	BASE=$(basename $FILENAME .md)

        # Create the directory in which new PDF will be saved
        #
        if [ ! -d $JEKYLL/$BASE ]; then
            mkdir -p $JEKYLL/$BASE
        fi

        # Create a temporary directory for use during creation of the PDF 
        # It will be deleted at the end of the process
        #
        if [ ! -d $WRITING/hold ]; then
            mkdir -p $WRITING/hold 
        fi

        # If the target PDF already exists delete it
        #
        # (For some reason, if I overwrite the exisiting file my browser will 
        # sometimes fail to open the PDF when the link is 'clicked' on the web
        # page)
        #
        if [ -f $JEKYLL/$BASE/$BASE.pdf ]; then
            rm $JEKYLL/$BASE/$BASE.pdf 
        fi 
        
        # ---------------------------------------------------------
        # Create the PDF
        # 

        # Convert target file to a PDF using pandoc
        #
        pandoc -f markdown $FILENAME \
            --metadata pagetitle=$BASE \
            --metadata author="Paul Dürnberger" \
        	--metadata lang="en-GB" \
            --standalone \
            --template ~/.pandoc/html/template-family-history.html \
           	--pdf-engine weasyprint \
        	--css ~/.pandoc/css/article.css \
            -o $WRITING/hold/TEMP.pdf  


        # Compress TEMP.pdf and generate the final output
        #
        # The compression options are;
        # -dPDFSETTINGS=/screen	    Low quality and small size. (72 dpi)
        # -dPDFSETTINGS=/ebook	    Better quality, slightly larger (150 dpi)
        # -dPDFSETTINGS=/prepress	Higher size and quality (300 dpi)
        # -dPDFSETTINGS=/printer	Suitable for printing (300 dpi)
        # -dPDFSETTINGS=/default	Useful for multiple purposes, but file can be large
        #
        ps2pdf -dPDFSETTINGS=/prepress $WRITING/hold/TEMP.pdf $JEKYLL/$BASE/$BASE.pdf 

        # Break the loop after the first file has been processed
        #
        break 
    
        # Delete the hold directory and its contents
        #
        rm -rf $WRITING/hold

        # Open the new PDF 
        #
        evince $JEKYLL/$BASE/$BASE.pdf &

    done

    # -------------------------------------------------------------
    # Create or open the corresponding Jekyll markdown file for 
    # editing
    #
    
    # With which category should this file be associated?
    #
    echo
    echo -n "Select a category (biography, connection or family): "
    echo

    read CHOICE
   
    JEKYLL_POSTS="/home/paul/Documents/Jekyll/Family_History/_posts/$CHOICE"

    # If the file doesn't exist create it. 
    #
    if [ ! -f ${JEKYLL_POSTS}/${BASE}.md ]; then

        {
            echo -e "---"
            echo -e "layout: post"
            echo -e "title: "
            echo -e "categories: $CHOICE"
            echo 
            echo -e "family_tree: "
            echo -e "featured_image: "
            echo 
            echo -e "synopsis: "
            echo
            echo -e "source: $BASE"
            echo -e "---"
            echo
        } > ${JEKYLL_POSTS}/${BASE}.md

        nvim \
            -c "norm 2j" \
            -c "norm 6l" \
            ${JEKYLL_POSTS}/${BASE}.md

    # If the file does exist, edit it 
    #
    else
        nvim \
            -c "norm Go" \
            -c "norm zz" \
            ${JEKYLL_POSTS}/${BASE}.md       
    fi

else 
    echo 
    echo -e "There are no markdown files here"
    echo
fi

