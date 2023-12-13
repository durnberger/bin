#!/bin/bash
#

# ~/bin/print-options.sh
#

# Colours
#
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m'	# NC=no colour

# What is being printed?
#
echo -e ${LIGHTGREEN}
echo -e "----------------"
echo -e "Printing Options"
echo -e "----------------"
echo -e ${NC}

echo
echo -e ${LIGHTRED}"Remember to 'cd' into the directory that holds the"
echo -e "file you want to process before running this script"${NC}
echo
echo -e "Processed files will be saved to '~/Documents'"
echo

# Choices
#
echo -e "Select from:"
echo
echo -e "1) Article (Markdown > PDF)"
echo -e "2) Article (HTML > PDF)"
echo -e "3) Create PDF for Family History web site (Markdown > PDF)"
echo -e "4) Letter (Markdown > PDF)"
echo
echo -e "Other Options:"
echo
echo -e "5) HTML > Markdown"
echo -e "6) DOCX > PDF"
echo -e "7) Take a URL and print the web page"

echo

read choice

if [ "$choice" == "1" ]; then
    # Article from Markdown
    bash ~/bin/print/pandoc-md-to-pdf.sh

elif [ "$choice" == "2" ]; then
    # Article from HTML
    bash ~/bin/print/pandoc-html-to-pdf.sh

elif [ "$choice" == "3" ]; then
    # Print a Web Page
    bash ~/bin/print/family-md-to-pdf.sh 

elif [ "$choice" == "4" ]; then
    # Letter
    bash ~/bin/print/pandoc-letter.sh

elif [ "$choice" == "5" ]; then
    # HTML to Markdown
    bash ~/bin/print/pandoc-html-to-md.sh

elif [ "$choice" == "6" ]; then
    # DOCX to PDF
    bash ~/bin/print/pandoc-docx-to-pdf.sh

elif [ "$choice" == "7" ]; then
    # Print a Web Page
    bash ~/bin/print/print-web-page.sh

else
    # Exit
    echo
    echo -e "Goodbye!"
    exit

fi
