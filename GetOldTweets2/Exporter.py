# -*- coding: utf-8 -*-
import sys, getopt, datetime, codecs, os
import re

if sys.version_info[0] < 3:
    import got

    print("use py2.7")
else:
    import got3 as got


def main(argv):
    # argv = ['--querysearch', 'python swallow','--maxtweets', '10', '--since', '2018-06-13', '--lang', 'english']

    if len(argv) == 0:
        print('You must pass some parameters. Use \"-h\" to help.')
        return

    if len(argv) == 1 and argv[0] == '-h':
        f = open('exporter_help_text.txt', 'r')
        print(f.read())
        f.close()

        return

    try:
        opts, args = getopt.getopt(argv, "", (
        "username=", "near=", "within=", "since=", "until=", "querysearch=", "toptweets=", "maxtweets=", "output=",
        "lang="))

        tweetCriteria = got.manager.TweetCriteria()
        outputFileName = "output_got.csv"

        for opt, arg in opts:
            if opt == '--username':
                tweetCriteria.username = arg

            elif opt == '--since':
                tweetCriteria.since = arg

            elif opt == '--until':
                tweetCriteria.until = arg

            elif opt == '--querysearch':
                tweetCriteria.querySearch = arg

            elif opt == '--toptweets':
                tweetCriteria.topTweets = True

            elif opt == '--maxtweets':
                tweetCriteria.maxTweets = int(arg)

            elif opt == '--near':
                tweetCriteria.near = '"' + arg + '"'

            elif opt == '--lang':
                tweetCriteria.lang = '"' + arg + '"'

            elif opt == '--within':
                tweetCriteria.within = '"' + arg + '"'

            elif opt == '--output':
                outputFileName = arg

        # outputFile = codecs.open(outputFileName, "w+", "utf-8")
        # outputFile.write('username\tdate\tretweets\tfavorites\ttext\tgeo\tmentions\thashtags\ttweetid\tconversationid\treplyto\tpermalink\timagelink')

        if os.path.isfile(outputFileName):
            outputFile = codecs.open(outputFileName, "a", "utf-8")
        else:
            outputFile = codecs.open(outputFileName, "a", "utf-8")
            outputFile.write(
                'username,date,retweets,favorites,text,geo,mentions,hashtags,tweetid,conversationid,replyto,permalink,imagelink')

        print('Searching...\n')

        def receiveBuffer(tweets):
            for t in tweets:
                # print(t.username)
                # re.sub(r"[\"]", "'", t.text)
                outputFile.write(('\n"%s","%s",%d,%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s"' % (
                t.username, t.date.strftime("%Y-%m-%d-%H:%M"), t.retweets,
                t.favorites, t.text.replace("\"", "'"), t.geo, t.mentions, t.hashtags, t.tweetid, t.conversationid, t.replyto, t.permalink,
                t.imglink)))
            outputFile.flush()
            print('More %d saved on file...\n' % len(tweets))

        got.manager.TweetManager.getTweets(tweetCriteria, receiveBuffer)

    except arg:
        print('Arguments parser error, try -h' + arg)
    finally:
        outputFile.close()
        print('Done. Output file generated "%s".' % outputFileName)


if __name__ == '__main__':
    main(sys.argv[1:])
