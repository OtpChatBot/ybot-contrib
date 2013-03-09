#!/usr/bin/env ruby

#
# Ybot base58 encoder and decoder
# Usage: Ybot base58 encode some_string
#        Ybot base58 decode some_string
#
# Deps:
#
#    gem install base58

require 'base58'

# Check arguments
if ARGV.length < 2
	puts 'Wrong usage.\nUsage:Ybot base58 encode some_string\nYbot base58 decode some_string'
	exit
end

begin
	if ARGV[0] == 'decode'
		puts Base58.encode(ARGV[1])
	elsif ARGV[0] == 'encode'
		puts Base58.decode(ARGV[1])
	else
		puts 'Wrong usage.\nUsage:Ybot base58 encode some_string\nYbot base58 decode some_string'
		exit
	end
rescue ArgumentError
	puts 'Wrong usage.\nUsage:Ybot base58 encode 12345\nYbot base58 decode A2Ph'
	exit
end