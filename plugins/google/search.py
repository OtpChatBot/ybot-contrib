#
# Ybot search information for you with Google.
#
# Author 0xAX (https://github.com/0xAX)
#
# Usage: 
#
#  Ybot search Ybot configuration
#

import sys
import json
import urllib

# Make search at Google
def make_search(query):
  # result string
  result = ''
  h_temp = ''
  # body query
  body = urllib.urlencode({'q': query})
  # api url
  url = 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0&%s' % body
  # make request
  response = urllib.urlopen(url)
  # read results
  results = response.read()
  # make json
  results = json.loads(results)
  # Get response data
  data = results['responseData'] 
  # Total result string
  total_result = 'Total results: %s' % data['cursor']['estimatedResultCount']
  # Get hits
  hits = data['results']
  # hits string
  hits_string = 'Top %d hits:' % len(hits)
  # Print urls
  for h in hits: 
    h_temp += h['url'] + '\n'
  # other  
  other = 'For more results, see %s' % data['cursor']['moreResultsUrl']
  # Accumulate all results
  result += total_result + '\n' + hits_string + '\n' + h_temp + '\n' + other
  # return
  print result

try:
  # Get search query
  query = sys.argv[1]
  make_search(query)
except Exception:
  # Return error string
  print 'Wrong usage of travis plugin.'