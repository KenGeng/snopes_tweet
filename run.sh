#!/bin/bash
#!/usr/bin/python

echo 'run program start'

iter=0	# iter
keyword=""
key_num=$((4)) # change this variable to set the number of words used to match
while [[ $iter -lt $key_num ]]; do
	
	description_name=".["$iter"].description"
	description=`cat $1 | jq $description_name`
	if [ -n "$description" ]; then
		len=${#description}
    	keyword=${keyword}${description:1:len-2}
    	keyword=${keyword}" "
		iter=$(($iter+1))
		echo $iter
	fi
	
done

#get the name of input file
result_file=${1/$".json"/$""}
echo $result_file
result_file=${result_file/$"JsonFile"/$""}
len=${#result_file}

result_file="./CsvResult/"${result_file:3:len-3}
echo $keyword
echo ${result_file}
result_file=${result_file}
result_file=${result_file}".csv"
echo ${result_file}
python ../GetOldTweets/Exporter.py --querysearch "$keyword" --maxtweets 20 --since "2004-01-10" --output "$result_file"
echo "Done."