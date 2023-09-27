#!/bin/bash
#

# ~/bin/pandoc-css.sh
#

echo
echo -e "---------------------------------------"
echo -e "Sass Conversion in the Pandoc Directory"
echo -e "---------------------------------------"
echo
echo -e "Run this script whenever changes are made to the"
echo -e "'.scss' files within the '~/.pandoc/css/sass'"
echo -e "directory"
echo

cd ~/.pandoc/css/sass

sass build-webpage.scss ../build-webpage.css
sass print-article.scss ../print-article.css
sass print-letter.scss ../print-letter.css
sass print-memo.scss ../print-memo.css 

echo
echo -e "Conversions completed"
echo
