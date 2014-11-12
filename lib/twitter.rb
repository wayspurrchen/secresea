require 'twitter'
require 'pry-byebug'

module Secresea
	class Twitter
		def self.tweet_author(tweet)
			tweet[:screen_name]
		end

		def self.tweet_text(tweet)
			tweet[:text]
		end

		def self.mentioned_users(tweet)
			ums = []
			tweet[:entities][:user_mentions].each do |um|
				ums << um
			end
			ums
		end

		def self.tweet_has_image(tweet)
			!tweet[:media].empty?
		end
	end
end