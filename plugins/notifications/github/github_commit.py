#!/usr/bin/python

#
# Ybot github commits notification plugin.
#
# Required params:
#
#  OWNER - repository owner
#  REPO  - repository name
#

OWNER = ''
REPO = ''

import sys

if OWNER == '' or REPO == '':
    print 'OWNER and REPO must be filed'
    sys.exit

import urllib
import urllib2
import simplejson as json
from httplib2 import Http
import httplib
import datetime

def find_between( s, first, last ):
    try:
        start = s.index( first ) + len( first )
        end = s.index( last, start )
        return s[start:end]
    except ValueError:
        return ""

def find_between_r( s, first, last ):
    try:
        start = s.rindex( first ) + len( first )
        end = s.rindex( last, start )
        return s[start:end]
    except ValueError:
        return ""

class RequestWithMethod(urllib2.Request):
  def __init__(self, *args, **kwargs):
    self._method = kwargs.pop('method', None)
    urllib2.Request.__init__(self, *args, **kwargs)

  def get_method(self):
    return self._method if self._method else super(RequestWithMethod, self).get_method()

#
# Ybot rest api url
#
ybot_api_url = 'http://localhost:8090/memories/?plugin=github_commit'
ybot_api_url2 = "http://localhost:8090/memories/"

api_url = 'https://api.github.com/repos/' + OWNER + '/' + REPO + '/commits'
# send response
response = urllib2.urlopen(api_url)
# get html page
commits = response.read()

message = json.loads(commits)[0]['commit']['message']
author = (json.loads(commits)[0]['commit']['committer'])['name']
sha = (json.loads(commits)[0]['commit']['tree'])['sha']

result = REPO + ' update.\n' + author + ' :' + message + ' ' + sha

################################
# Work with Ybot brain api
################################
response = urllib2.urlopen(ybot_api_url)
# read response
json_data = response.read()
ybot_response_result = json.loads(json_data)

if ybot_response_result == []:
    #
    # save data to ybot
    jdata = json.dumps({"id":"github_commit", "plugin": "github_commit", "key":"url",
                        "value":sha, "created":"2013-03-13 23:45:00"})
    conn = httplib.HTTPConnection("localhost", port=8090)
    conn.request("POST", "/memories", jdata, headers={'Content-Type': 'application/json'})
    
    # return result
    print result
else:
    if ybot_response_result[0]['value'] == sha:
        print ""
    else:       
        note_id = ybot_response_result[0]['id']
        #
        # Send delete request
        #
        req = RequestWithMethod(ybot_api_url3 + note_id, method="DELETE")
        f = urllib2.urlopen(req)
        response = f.read()
        f.close()
        
        #
        # Save new value to ybot storage
        #
        jdata = json.dumps({"id":"github_commit", "plugin": "github_commit", "key":"url",
                            "value":sha, "created":"2013-03-13 23:45:00"})
        conn = httplib.HTTPConnection("localhost", port=8090)
        conn.request("POST", "/memories", jdata, headers={'Content-Type': 'application/json'})

        # return result
        print result
