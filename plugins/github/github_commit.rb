#!/usr/bin/env ruby

#
# Ybot Github commits
# Usage:
#       # Get 5 last commits
#       Ybot github_commit owner/repo
#
# Required parameters:
#
#   * GITHUB_USER - github account user name
#   * GITHUB_PASSWORD - github account password
#

require 'json'
require 'uri'
require 'net/http'
require 'net/https'

# Github user name
GITHUB_USER = '0xAX'
# Github password
GITHUB_PASSWORD = '1457s288814252'

# Check github user and Github Password
if GITHUB_PASSWORD == '' or GITHUB_USER == ''
	puts 'Please, give me github account: GITHUB_PASSWORD & GITHUB_USER'
	exit(0)
end

# Github api url
api_url = 'https://api.github.com/'

# Check command line arguments
if ARGV.length != 1
	puts 'Wrong arguments.\nUsage:Ybot github_issue owner/repo title: body: issues body'
    exit(0)
end

# Get owner/repo
arg = ARGV[0]

# get owner
owner = arg.split(' ')[0].split('/')[0]
# get repo
repo = arg.split(' ')[0].split('/')[1]

# send request to github api
uri = URI.parse(api_url + 'repos/' + owner + '/' + repo + '/commits')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
request = Net::HTTP::Get.new(uri.request_uri)
request.basic_auth GITHUB_USER, GITHUB_PASSWORD
response = JSON.parse(http.request(request).body)

result = ''

if response.length <= 5
	for i in response[0..response.length]
		result += 'sha: ' + i['sha'] + ' url: ' + i['url'] + ' message: ' + i['commit']['message'] + ' author: ' + i['commit']['author']['name'] + "\n"
	end
else
	commits = response[0..4]
	for i in commits
		result += 'sha: ' + i['sha'] + ' url: ' + i['url'] + ' message: ' + i['commit']['message'] + ' author: ' + i['commit']['author']['name'] + "\n"
	end
end

# return result
puts result
