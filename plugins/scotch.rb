#!/usr/bin/env ruby

#
# Ybot scotch :)
#
# Usage:
#
# Ybot scotch
#

scotch =  ["https://s3.amazonaws.com/scotch-assets/scotch_1.jpg",
           "https://s3.amazonaws.com/scotch-assets/scotch_2.jpg",
           "https://s3.amazonaws.com/scotch-assets/scotch_3.jpg",
           "https://s3.amazonaws.com/scotch-assets/scotch_4.jpg",
           "https://s3.amazonaws.com/scotch-assets/scotch_5.jpg"]
           
puts pictures[rand(scotch.length)]
