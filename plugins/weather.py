#
# Ybot show you weather by request
#
# Usage:
#
# Ybot weather Chicago
#
# Necessary parameters:
#
# API_KEY - api key from http://www.wunderground.com/

import sys
import json
import urllib2

# Set api key
API_KEY = ''

# Check arguments
if len(sys.argv) != 2:
	print 'Wrong arguments\nUsage: Ybot weather Chicago'
	exit(0)

if API_KEY == '':
	print 'I need in API_KEY for weather request. See ybot-contrib/weather.py plugin.'
	exit(0)

weather = 'Weather in ' + sys.argv[1] + ': '

# Get location
location = sys.argv[1]

try:
	# Send request and read response
	response = urllib2.urlopen('http://api.wunderground.com/api/' + API_KEY + '/conditions/q/' + location + '.json').read()
except Exception:
	response = ''

# get weather
weat = json.loads(response)['current_observation']['weather'] + '\n'
# get temperature
temperature = 'Temperature: ' + json.loads(response)['current_observation']['temperature_string'] + '\n'
# get humidity
humidity = 'Humidity: ' + json.loads(response)['current_observation']['relative_humidity'] + '\n'
# get wind
wind = 'Wind: ' + json.loads(response)['current_observation']['wind_string']  + '\n'
# get wind direction
wind_dir = 'Wind direction: ' + json.loads(response)['current_observation']['wind_dir'] + '\n'
# get full forecast url
full = 'Full forecast url: ' + json.loads(response)['current_observation']['forecast_url']

print weather + weat + humidity + wind + wind_dir + full