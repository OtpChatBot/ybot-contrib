"""
Returns random video by request

Usage:

  Ybot youtube funny cat

"""

import sys
import json
import urllib
import random

# check args
if len(sys.argv) > 2 or len(sys.argv) < 2:
    # print log
    print 'Wrong usage.\nUsage:\nYbot youtube funny cat'
    # exit
    sys.exit()

# get command line argument
arg = urllib.urlencode({'q': sys.argv[1]})
# youtube api url
api_url = 'https://gdata.youtube.com/feeds/api/videos?' + arg + '&orderBy=relevance&alt=json'

"""
Make requets to youtube
"""
# make request
response = urllib.urlopen(api_url)
# read results
results = response.read()
# make json
results = json.loads(results)['feed']['entry']

videos = ''
# random video
videos_count = random.randint(0, len(results) - 1)
# return
print results[videos_count][u'media$group']['media$title']['$t'] + ':\n' + (results[videos_count][u'media$group']['media$player'])[0]['url']
