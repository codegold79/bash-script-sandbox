#! /bin/bash

# Script by romanlv
# Posted at https://www.linuxquestions.org/questions/linux-software-2/convert-m4b-to-mp3-batch-682854/
# This script takes m4b and m4a type files and converts them to mp3 using the faad tool.

mkdir -p mp3s

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for i in `find . -type f -iname "*.m4[ab]" -print`; do
	echo $i
	NAME=`echo $i | sed -e 's/\.\///' -e 's/\.m4b//g' `

	echo "doing '$NAME'"
	faad --stdio $i | lame --preset standard - "mp3s/${NAME}.mp3"
done

IFS=$SAVEIFS
