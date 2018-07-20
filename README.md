# snopes_tweet
use GetOldTweets to crawle tweets according to keywords extracted by Google Cloud API

# usage
run in commmand line:

```
mutil_run.sh number
```
"number" is the the integer of json files' number in `JsonFile` directory you want to use.
Just set it to be the max number of Json file number like 1200.
Shell can run correctly.

You can view results of Tweet in csv format in `CsvResult` Dir.

# description

For a single run, I use the top 5 keywords in json which are collected by Google API and splice them into a query used by GetOldTweets.
This is implemented in bash shell in `run.sh`

For multiple run, I write `multi_run.sh` for convenience.