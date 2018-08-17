# snopes_tweet
use GetOldTweets_modified(work in python3.6) to crawl tweets according to keywords extracted by Google Cloud API or by human label
# Dependency
1. python3.6
2. 
```
pip install -r requirements.txt
```
# Usage
1. run in commmand line:

```
run_v2.sh number
```
"number" is the the integer of json files' number in `JsonFile` directory you want to use.
Just set it to be the max number of Json file number like 1200.
Shell can run correctly.

You can view results of Tweet in csv format in `CsvResult` Dir.

# Description

For a single run, I use the top 5 keywords in json which are collected by Google API and splice them into a query used by GetOldTweets.
This is implemented in bash shell in `run.sh` (update: keywords from Googl API does not work well, so we use keywords human labelled instead.)

For multiple run, I write `run_v2.sh` for convenience.

# Count
If you want to count the meaningful data which has some relevant tweets, just run `count.sh 2000`
You can view the result at `Meaningful.txt`.

# Other detail
When you finish crawling, you can use csv2json.py to get json format data.