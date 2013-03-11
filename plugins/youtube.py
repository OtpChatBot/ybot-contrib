"""
Search video in youtube.com with Ybot 

Usage:

  Ybot youtube funny cat

"""

import sys
import json
import urllib
import random

# check args
if len(sys.argv) > 2:
	# print log
	print 'Wrong usage.\nUsage:\nYbot youtube\nYbot youtube 5'
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

count = 0
videos = ''

if len(results) < 5:
	for i in results:
		videos += str(count) + '. ' + i[u'media$group']['media$title']['$t'] + ' ' + (i[u'media$group']['media$player'])[0]['url'] + '\n'
		count += 1
else:
	while (count < 5):
		videos += str(count) + '. ' + results[count][u'media$group']['media$title']['$t'] + ' ' + (results[count][u'media$group']['media$player'])[0]['url'] + '\n'	
		count += 1
# return
print videos[:-1]
