#!/bin/bash 

# Convert a batch of PDF files to JPG using 'pdftoppm'

for FILE in *.pdf;

do
	STEM=$(basename $FILE .pdf)
	
	pdftoppm $FILE $STEM -jpeg

done
