#
# Ybot search images Google image search.
#
# Author 0xAX (https://github.com/0xAX)
#
# Usage: 
#
#  Ybot img twitter logo
#

import sys
import json
import urllib
import random

# Search image in google image search
# and return random image.
def search_img(query):
	# api url
	api_url = 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=' + urllib.quote_plus(query)
	# make request
  	response = urllib.urlopen(api_url)
  	# read results
  	results = response.read()
  	# make json
  	results = json.loads(results)['responseData']['results']
  	# get random image
  	random_image = random.randint(0, len(results) - 1)
  	# get image
  	img = results[random_image]
  	# return
  	print img['unescapedUrl']

try:
  # Get search query
  query = sys.argv[1]
  search_img(query)
except Exception:
  # Return error string
  print 'Wrong usage of travis plugin.'


