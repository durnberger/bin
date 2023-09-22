#!/bin/bash

echo
echo -e "------------------------"
echo -e "Save a Web Page as a PDF"
echo -e "------------------------"
echo

echo -e "Paste the web address below:"
echo
read file

echo

# Variables
temp=/home/$USER/tmp/tex2pdf
stem=$(basename ${file} .html)

# If the 'temp' directory doesn't exist, create it
if [[ ! -f $temp ]]; then
    mkdir -p $temp
fi

# Run the conversion
pandoc ${file} \
       --metadata pagetitle="$stem" \
       --metadata lang="en-GB" \
       --metadata author="Paul Dürnberger" \
       -V geometry:a4paper \
       -V geometry:landscape \
       -o ~/Documents/${stem}.pdf

# Display completed document or warn if it not created
if [[ -f ~/Documents/${stem}.pdf ]]; then
    evince ~/Documents/${stem}.pdf

else
    echo
    echo -e "WARNING!!"
    echo -e "The PDF file was not created"
    echo
fi
