require 'spec_helper'
require 'twitter_ebooks'
require 'pry-byebug'
require_relative 'fixtures/tweets/tweet_with_mention.rb'

describe Secresea do
	include Secresea
	# describe PixelSorter::Twitter do
		# describe '#string_has_cmd' do
		# 	it "finds 'cmd[*]' in a string correctly" do
		# 		found = PixelSorter::Twitter.string_has_cmd "@pixelsorter cmd[max 20 min 10] http://pic.twitter.com"
		# 		expect(found).to eq(true)
		# 	end
		# 	it "does not find 'cmd[*]' if it's not there" do
		# 		found = PixelSorter::Twitter.string_has_cmd "@pixelsorter max 20 min 10 http://pic.twitter.com"
		# 		expect(found).to eq(false)
		# 	end
		# end
	# end
end