#!/usr/bin/env bash

echo 'count program start'
iter=0	# iter
count=0
minsize=$((110))
while [[ $iter -lt $1 ]]; do
	filename="./CsvResult/"${iter}".csv"

	echo $filename
	if [ -f "$filename" ]; then

	    filesize=`ls -l $filename | awk '{ print $5 }'`
	    if [ $filesize -gt $minsize ]; then
		    count=$(($count+1))
		    echo $filename >> "Meaningful.txt"
	    fi

		echo $iter
	fi
	iter=$(($iter+1))

done
echo "the number of meaningful data:"
echo $count
echo "Done"