#!/usr/bin/env ruby

#
# Deploy your application with Ybot
#
# Usage:
#
#   Ybot deploy deploy:setup
#   Ybot deploy deploy:update
#   Ybot deploy -T
#

# Check config file
if File.exist?('config') == true
	begin
	# get command line arg
	arg = ARGV[0]
	# Check arg
	if arg == 'deploy:setup' or arg == '-T' or arg == 'deploy:update'		
		# start deploy with capistrano
		exec('cap \'-f config ' + 'arg \'')
		# return
		puts 'Done'
	else
		puts 'Sorry, wrong argument'
	end
	rescue Exception => e
		puts 'Error: ' + e
	end
else
	puts 'Sorry, config file missed'
end
