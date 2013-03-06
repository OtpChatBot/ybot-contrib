#
# This is plugin for Ybot, travis-ci management.
#
# Author 0xAX (https://github.com/0xAX)
#
# Usage: 
#
#  Ybot travis all
#
#  Ybot travis repo Owner RepoName
#

import sys
import urllib
import urllib2
import simplejson as json

# Get all repositories
def get_all_repositories():
	# result string
	repositores = ''
	# api url
	api_url = 'https://api.travis-ci.org/repos/'
	# make request
	response = urllib2.urlopen(api_url)
	# get repos
	repos = json.loads(response.read())
	# traverse all repos and return
	for rep in repos:
		repositores += str(rep['id']) + '. ' + rep['slug'] + ' \ndescription: ' + rep['description'] + '\nStatus: ' + xstr(rep['last_build_result']) + '\n'
	# print all repositories
	print repositores[:-1]

# get repository by id	
def get_repo_by_id(Author, RepoName):
	# result string
	repository = ''
	# api url
	api_url = 'https://api.travis-ci.org/repos/' + Author + '/' + RepoName
	# make request
	response = urllib2.urlopen(api_url)
	# get repos
	repo = json.loads(response.read())
	try:
		repository += str(repo['id']) + '. ' + repo['slug'] + ' \ndescription: ' + repo['description'] + '\nStatus: ' + xstr(repo['last_build_result'])
		print repository[:-1]
	except Exception:
		print 'Sorry, repository ' + Author + '/' + RepoName + ' not found.'


# Convert None to str
def xstr(s):
    return 'None' if s is None else str(s)

# Get command line args and format it
mode = filter(lambda c: c != '', sys.argv[1].split(' '))
# Get args count
args_count = len(mode)

if mode[0] == 'all':
	# return all repositories
	get_all_repositories()
elif (mode[0] == 'repo') and (args_count == 3):
	# get repository info
	get_repo_by_id(mode[1], mode[2])
else:
	print 'Wrong usage of travis plugin.\nUsage:\nYbot travis all\nYbot travis repo Owner RepoName'