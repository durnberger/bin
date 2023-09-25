#!/bin/bash

# Convert .dot to .svg

echo -e "------------"
echo -e ".dot to .svg"
echo -e "------------"
echo 
echo -e "This script wil convert Graphviz '.dot' files to '.svg'"
echo

for file in *.dot;
	do
		stem=$(basename $file .dot)
		dot -Tsvg $file -o $stem.svg

	done

