#!/bin/bash
#

echo
echo -e "------------------"
echo -e "Obsidian to Jekyll"
echo -e "------------------"
echo
echo -e "This script will make minor changes to the files"
echo -e "created in Obsidian so they can then be processed"
echo -e "by Jekyll"
echo
echo -e "This script is designed for use the the family"
echo -e "history project"
echo

# Variables
pdir="${HOME}/tmp/hold"
project="${HOME}/Dropbox/Documents/FH_Jekyll/_posts"

# If the directory 'tmp' doesn't exist, create it
if [ ! -d ${pdir} ]; then
    mkdir -p ${pdir}
fi

for file in *.md
do
	cp ${file} ${pdir}

	# Edit the links
#	sed -i 's/(00/(\..\/00/g' ${pdir}/${filename}
	sed -i 's/.md/.html/g' ${pdir}/${file}
	sed -i 's/(assets/(\/assets/g' ${pdir}/${file}
	
	# Move processed file to Jekyll project
	mv ${pdir}/${file} ${project}

done

# The 'tmp' file is not needed and can be deleted
rm -rf ${pdir}

