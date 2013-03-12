#!/usr/bin/env ruby

#
# Ybot return fortune
# Usage: Ybot fortune
#

require 'net/http'
require 'uri'

# Make http request
uri = URI.parse('http://www.fortunefortoday.com/getfortuneonly.php')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
# return
puts http.request(request).body