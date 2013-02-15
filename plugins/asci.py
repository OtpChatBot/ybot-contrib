"""
Ybot show text in asci

Usage:

  Ybot asci Hello Ybot

"""

import sys
import urllib
import urllib2

if len(sys.argv) != 2:
	print 'Wrong arguments\nUsage: Ybot asci Hello Ybot'
	exit(0)

# Get text for checking
text = sys.argv[1]
# api url
api_url = 'http://asciime.heroku.com/generate_ascii?s=' + urllib.quote_plus(text)
# Send request and return
print urllib2.urlopen(api_url).read()