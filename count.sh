#!/usr/bin/env bash

echo 'count program start'
iter=0	# iter
count=0 # counter for files with corresponding csv files
count2=0 # counter for files with more than 100 corresponding csv files
minsize=$((110))
while [[ $iter -lt $1 ]]; do
	filename="./CsvResult2/"${iter}".csv"

	echo $filename
	counter2=`grep -c "" $filename`
	if [ -f "$filename" ]; then

	    filesize=`ls -l $filename | awk '{ print $5 }'`
	    if [ $filesize -gt $minsize ]; then
		    count=$(($count+1))
		    if [ -f "./CsvResult2/Meaningful.txt" -a $count -eq 1 ]; then
		        echo $filename > "Meaningful.txt"
		    else
		        echo $filename >> "Meaningful.txt"

		    fi
		    if [ -f "./CsvResult2/Meaningful_100.txt" -a $counter2 -lt 100 ]; then
		        count2=$(($count2+1))
		        echo $filename > "Meaningful_100.txt"
		    else
		        echo $filename >> "Meaningful_100.txt"

		    fi

	    fi

		echo $iter
	fi
	iter=$(($iter+1))

done
echo "the number of meaningful data:"
echo $count
echo $count2
echo "Done"