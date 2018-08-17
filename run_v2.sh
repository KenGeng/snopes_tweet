# a shell script for collecting all relevant tweets using GetOldTweets_modified/Exporter.py


#!/bin/bash
echo 'multi-run program start'
iter=0	# iter
# Attentin!! iter is different from id. keep that in mind
# $1 is the max id you want
if [ ! -d "./CsvResult_true_last200" ];then
mkdir "./CsvResult_true_last200"
fi


while [[ $iter -lt $1 ]]; do
	filename="./twitter_true_后200.json"
	raw_keyword=`cat $filename | jq '.['$iter'].keyword'`
	len0=${#raw_keyword}
	keyword=${raw_keyword:1:len0-2}
	id=`cat $filename | jq '.['$iter'].id'`
	len=${#id}
	result_file="./"${id:1:len-2}
    echo $keyword
    echo ${result_file}
    result_file=${result_file}".csv"
    echo ${result_file}
#    sleep 10s
	if [ "$keyword" != "ul" -a "$keyword" != "\"\"" ]; then
		echo $iter
		echo $keyword
		echo $result_file
		python ./GetOldTweets_modified/Exporter.py --querysearch "$keyword" --maxtweets 200 --since "2015-08-01" --lang en --output "$result_file"
#		python ./GetOldTweets_modified/Exporter.py --querysearch "$keyword" --maxtweets 100 --since "2010-01-01" --output "$result_file"
	    echo "Done."
	fi

	iter=$(($iter+1))

done

echo "All Done!"
