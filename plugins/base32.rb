#!/usr/bin/env ruby

#
# Ybot base32 encoder and decoder
# Usage: Ybot base32 encode some_string
#        Ybot base32 decode some_string
#
# Deps:
#
#    gem install base32

require 'base32'

# Check arguments
if ARGV.length < 2
	puts 'Wrong usage.\nUsage:Ybot base32 encode some_string\nYbot base32 decode some_string'
	exit
end

if ARGV[0] == 'decode'
	puts Base32.encode(ARGV[1])
elsif ARGV[0] == 'encode'
	puts Base32.decode(ARGV[1])
else
	puts 'Wrong usage.\nUsage:Ybot base32 encode some_string\nYbot base32 decode some_string'
	exit
end
