#! /bin/bash
#

# Workflow for the Family History Project
# This script will;
# 1. Update the family tree diagrams
# 2. Modify the markdown files
#

PROJECT_FOLDER="${HOME}/Documents/Family_History"

# Tree Diagrams
#
# cd to the 'Family_History/assets/trees' directory
cd ${PROJECT_FOLDER}/assets/trees

# Convert .dot files to .svg
. ~/bin/dot2svg.sh

# Post Files
#
# cd to the 'Family_History' root directory
cd ${PROJECT_FOLDER}

# Modify the markdown files for use with Jekyll
. ~/bin/obsidian2jekyll.sh

exit
