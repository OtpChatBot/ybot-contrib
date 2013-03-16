#
# Send sms with twillio
#
# Usage:
#     Ybot sms to_phone message
#     Ybot sms +000000000000 message
#
# Required libs:
#
#  * twilio-ruby
#  * rubygems
#
# Required fields:
#
#  * ACCOUNT_SEED
#  * AUTH_TOKEN
#  * FROM
#

require 'rubygems'
require 'twilio-ruby'

ACCOUNT_SEED = ''
AUTH_TOKEN = ''
FROM = ''

# check account seed, auth token and FROM fields
if ACCOUNT_SEED == '' or AUTH_TOKEN == '' or FROM == ''
	puts 'ACCOUNT_SEED and AUTH_TOKEN fileds must be not empty'
	exit
end

# check arguments count
if ARGV.length != 1
    puts 'Wrong usage.\nUsage:\n  Ybot Ybot sms +000000000000 message'
    exit
end

# get to field
to = ARGV[0].lstrip.split(' ')[0]
# get message field
message = ARGV[0].split(to)[1].lstrip
# Send sms
client = Twilio::REST::Client.new(ACCOUNT_SEED, AUTH_TOKEN)
# send sms
client.account.sms.messages.create({:from => FROM, :to => to , :body => message})
# return
puts 'Done'