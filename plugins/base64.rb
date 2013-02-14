#!/usr/bin/env ruby

#
# Ybot base64 encoder decoder
# Usage: Ybot base64 encode some_string
#        Ybot base64 decode some_string
#

require 'base64'

# Check arguments
if ARGV.length < 2
	puts 'Wrong usage.\nUsage:Ybot base64 encode some_string\nYbot base64 decode some_string'
	exit
end

if ARGV[0] == 'decode'
	puts Base64.decode64(ARGV[1])
elsif ARGV[0] == 'encode'
	puts Base64.encode64(ARGV[1])
else
	puts 'Wrong usage.\nUsage:Ybot base64 encode some_string\nYbot base64 decode some_string'
	exit
end
