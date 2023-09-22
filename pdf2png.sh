#!/bin/bash

## Convert .pdf to .png
#
echo -e "Converting .pdf to .png..."
echo

for file in *.pdf;

  do

  stem=$(basename $file .pdf)

  pdftoppm $file $stem -png

  done
