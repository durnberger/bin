#!/bin/bash

#for i in $(find);

#do 
#    if grep -i '\<midgley\>' $i; then
#        ls "$i"

#    fi

#done

grep -i '\<midgley\>' | find ${dir} -name "*.md"
