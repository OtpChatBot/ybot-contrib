#!/usr/bin/env ruby

#
# Ybot show map with google maps
# Usage: Ybot map area in Chicago
#

require 'uri'

# check argument
if ARGV.length != 1
    puts 'Wrong usage.\nUsage:Ybot map area in Chicago'
    exit
end

# get argumet
location = URI::escape(ARGV[0])
# api url
puts 'http://maps.google.com/maps/api/staticmap?markers=' + location + '&size=400x400&maptype=roadmap&sensor=false&format=png'
