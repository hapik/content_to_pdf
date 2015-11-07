#!/bin/bash
path=/home/_userid_/Documents

xclip -out > $path/read.txt
pandoc $path/read.txt --reference-odt=$path/read_formating.odt -o $path/read.odt
unoconv $path/read.odt -o $path/read.pdf
rm $path/read.odt
rm $path/read.txt

evince $path/read.pdf

exit
