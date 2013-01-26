#
# Ybot with communicates with reddit.com api.
#
# Author 0xAX (https://github.com/0xAX)
#
# Usage: 
#
#  Ybot reddit joke
#

import sys
import random
import urllib2
import simplejson as json

# Get command line argument
mode = filter(lambda c: c != '', sys.argv[1].split(' '))

if mode[0] == 'joke':
	# jokes list
	jokes_list = []
	# api url
	api_url = 'http://www.reddit.com/r/jokes.json'
	# make request
	response = urllib2.urlopen(api_url)
	# read response
	jokes = json.loads(response.read())
	# traverse all jokes
	for joke in jokes['data']['children']:
		# collect jokes
		jokes_list.append('Title: ' + joke['data']['title'] + '\nContent: ' + joke['data']['selftext'])
	# return
	print jokes_list[random.randint(0, len(jokes_list) - 1)].encode('utf-8')
else:
	print 'Wrong usage of travis plugin.'