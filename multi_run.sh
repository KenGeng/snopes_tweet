#!/bin/bash
echo 'multi-run program start'
iter=0	# iter

while [[ $iter -lt $1 ]]; do
	filename="./JsonFile/"${iter}".json"
	echo $filename
	if [ -f "$filename" ]; then 
		sh ./run.sh $filename
		echo $iter
	fi
	iter=$(($iter+1))
	
done
echo "Done"
