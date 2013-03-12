#!/usr/bin/env ruby

#
# Ybot return funny commit message
# Usage: Ybot commitmessage
#

require 'net/http'
require 'uri'

# Make http request
uri = URI.parse('http://whatthecommit.com/index.txt')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
# return
puts http.request(request).body