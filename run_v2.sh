##!/bin/bash


#!/bin/bash
echo 'multi-run program start'
iter=1	# iter

if [ ! -d "./CsvResult2" ];then
mkdir "./CsvResult2"
fi


while [[ $iter -lt $1 ]]; do
	filename="./twitter_false_url.json"
	raw_keyword=`cat $filename | jq '.['$iter'].keyword'`
	len0=${#raw_keyword}
	keyword=${raw_keyword:1:len0-2}
	id=`cat $filename | jq '.['$iter'].id'`
	len=${#id}
	result_file="./CsvResult2/"${id:1:len-2}
    echo $keyword
    echo ${result_file}
    result_file=${result_file}".csv"
    echo ${result_file}
#    sleep 10s
	if [ "$keyword" != "null" -a "$keyword" != "\"\"" ]; then
		echo $iter
		echo $keyword
		echo $result_file
		python ./GetOldTweets2/Exporter.py --querysearch "$keyword" --maxtweets 200 --since "2010-01-01" --output "$result_file"
#		python ./GetOldTweets2/Exporter.py --querysearch "$keyword" --maxtweets 100 --since "2010-01-01" --output "$result_file"
	    echo "Done."
	fi

	iter=$(($iter+1))

done

echo "All Done!"
