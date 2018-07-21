#!/usr/bin/env bash

echo 'count program start'
iter=0	# iter
count=0
minsize=$((110))
while [[ $iter -lt $1 ]]; do
	filename="./backup_key_3_485pieces/CsvResult/"${iter}".csv"

	echo $filename
	if [ -f "$filename" ]; then

	    filesize=`ls -l $filename | awk '{ print $5 }'`
	    if [ $filesize -gt $minsize ]; then
		    count=$(($count+1))
		    if [ -f "./Meaningful.txt" -a $count -eq 1 ]; then
		        echo $filename > "Meaningful.txt"
		    else
		        echo $filename >> "Meaningful.txt"

		    fi

	    fi

		echo $iter
	fi
	iter=$(($iter+1))

done
echo "the number of meaningful data:"
echo $count
echo "Done"