#!/usr/bin/env ruby

#
# Ybot Github issues manipulating
# Usage: 
#       # Create issue
#       Ybot github_issue owner/repo title: body: issues body....
#
#       # Get issues
#       Ybot github_issue owner/repo
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
GITHUB_USER = ''
# Github password
GITHUB_PASSWORD = ''

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

# Check argument count
if ARGV.length == 1
	#
	# get issues info
	#
	issues = ''
	#
	# Make request
	#
	uri = URI.parse(api_url + 'repos/' + owner + '/' + repo + '/issues')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    json_resp = JSON.parse(response.body)
    # collect issues
    json_resp.each do |i|
    	issues = i["number"].to_s() + '. ' + i["title"] + '\n' + i["body"] + '\n' + i["url"] + '\n--------------------------------' 
    end
    # return issues
    puts issues
#
# create issue
#
else
	# title
	title = ''

	# Get body
	body = ''

	# get title
	title_tail = arg.split('title:')[1]
	title =  title_tail.split('body:')[0].strip

	# get body
	body = arg.split('body:')[1].strip

	# build body request
	json_body = {title: title, body: body}.to_json

	# Make request
	uri = URI.parse(api_url + 'repos/' + owner + '/' + repo + '/issues')
	#
	# Make request
	#
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
	request = Net::HTTP::Post.new(uri.request_uri,initheader = {'Content-Type' =>'application/json'})
	request.body  = json_body
	request.basic_auth GITHUB_USER, GITHUB_PASSWORD
	response = http.request(request)

	begin
		puts 'Issues created: ' + JSON.parse(response.body)["url"]
	rescue 
		puts 'Ooops, something going wrong'
	end
end
