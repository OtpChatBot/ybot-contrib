#!/usr/bin/env ruby

#
# Ybot returns Heroku status
# Usage: Ybot heroku_status
#

require 'net/http'
require 'json'

uri = URI('https://status.heroku.com/api/v3/current-status')
res = Net::HTTP.start(uri.host, use_ssl: true) do |http|
        request = Net::HTTP::Get.new(uri.request_uri)
        http.request(request)
      end
result = JSON.parse(res.body)

# get production status
prod = result['status']['Production']
# get development status
dev = result['status']['Development']
# return
puts 'Heroku status:\n' + 'Production: ' + prod + '\n' + 'Development: ' + dev + '\n'
