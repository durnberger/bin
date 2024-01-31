#!/bin/bash
#
# Used to generate a simple gallery from a directory of 
# pictures. Useful when there are a lot of images!

ROOT=/var/www/gallery 

# ------------------------------------------------------
# Generate a list of the filenames of the images found in
# the collection directory
#
IMAGES=$ROOT/images/
cd $IMAGES

# \ls runs the ls command but ignores my alias (as defined
# in ~/.bash_aliases). The output is written to
# $ROOT/list.txt 
\ls > $ROOT/list.txt 

# ------------------------------------------------------
# Create images.html
#
# If index.html exists, delete it
if [ -f "$ROOT/images.html" ]; then
    rm -f "$ROOT/images.html"
fi

# Create a new index.html
touch $ROOT/images.html

# Add the opening sections to index.html
{
    echo "<html>"
    echo "  <head>"
    echo "      <meta charset=\"utf-8\">"
    echo "      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=yes\">"
    echo "      <link rel=\"stylesheet\" href=\"style.css\">"
    echo "      <title>Images</title>"
    echo "  </head>"
    echo "  <body id=\"index\">"
    echo "      <header><h1>Images</h1></header>"
    echo "      <main>"
    echo
} > $ROOT/images.html

# Generate links and append the output to index.html.
# Each link will point to an .html page; those pages
# will be generated in the next stage of this process.
#
# Credit: https://alvinalexander.com/linux-unix/shell-script-process-every-lines-text-file-unix-linux/
FILE=$ROOT/list.txt

for ITEM in `cat $FILE`
do
    echo "<a href=\"pages/$ITEM.html\"><img src=\"images/$ITEM\" loading=\"lazy\"></a>" >> $ROOT/images.html 
done

# Finally append the closing elements to index.html
{
    echo
    echo "      </main>"
    echo "      <footer> </footer>"
    echo "  </body>"
    echo "</html>"
} >> $ROOT/images.html

# ------------------------------------------------------
# Create pages for the individual images. It is these pages
# to which the links created in the previous section will
# point.
#
PAGES="$ROOT/pages"

# To ensure we don't end up with orphan entries, delete 
# the $PAGES directory if it already exists
if [ -d $PAGES ]; then
    rm -rf $PAGES
fi 

# Create a new $PAGES directory
mkdir $PAGES

# Generate the pages using the filenames found in $FILE
for ITEM in `cat $FILE`

do
    touch $PAGES/"$ITEM.html"

    {
        echo "<html>"
        echo "  <head>"
        echo "      <meta charset=\"utf-8\">"
        echo "      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=yes\">"
        echo "      <link rel=\"stylesheet\" href=\"../style.css\">"
        echo "      <title>$ITEM</title>"
        echo "  </head>"
        echo "  <body id=\"page\">"
        echo "      <header> </header>"
        echo "      <main>"

        echo "          <figure>"
        echo "              <img src=\"../images/$ITEM\" alt=\"$ITEM\">"
        echo "              <figcaption>$ITEM</figcaption>"
        echo "          </figure>"

        echo "      </main>"
        echo "      <footer> </footer>"
        echo "  </body>"
        echo "</html>"

    } > $PAGES/"$ITEM.html"

done

