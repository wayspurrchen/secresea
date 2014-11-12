require 'twitter_ebooks'
require 'open-uri'
require 'pp'
require_relative './s3.rb'

module Secresea
  class Bot
    attr_accessor :last_public_tweet_timestamp

    def initialize(environment)
      Secresea::S3.setup
      puts Secresea::S3.secrets.inspect
      @last_public_tweet_timestamp = 0
      @last_hour_timestamp = Time.now.to_i
      @tweets_since_timestamp = 0
      @tweet_queue = []

      if environment == "production"
        Ebooks::Bot.new("secresea") do |bot|
          # Runs on @pixelsorter in production
          bot.consumer_key = ENV["SECRESEA_TWITTER_CONSUMER_KEY"]
          bot.consumer_secret = ENV["SECRESEA_TWITTER_CONSUMER_SECRET"]
          bot.oauth_token = ENV["SECRESEA_TWITTER_OAUTH_TOKEN"]
          bot.oauth_token_secret = ENV["SECRESEA_TWITTER_OAUTH_TOKEN_SECRET"]
          puts "Initializing in production mode..."

          run(bot)
        end
      elsif environment == "staging" || environment == "development"
        Ebooks::Bot.new("secreseatest") do |bot|
          # Runs on @pixelsortertest in staging
          bot.consumer_key = ENV["SECRESEA_TEST_TWITTER_CONSUMER_KEY"]
          bot.consumer_secret = ENV["SECRESEA_TEST_TWITTER_CONSUMER_SECRET"]
          bot.oauth_token = ENV["SECRESEA_TEST_TWITTER_OAUTH_TOKEN"]
          bot.oauth_token_secret = ENV["SECRESEA_TEST_TWITTER_OAUTH_TOKEN_SECRET"]
          puts "Initializing in staging mode..."

          run(bot)
        end
      else
        raise "Must specify a SECRESEA_ENVIRONMENT"
      end

      EM.run do
       Ebooks::Bot.all.each do |bot|
          bot.start
        end
      end
    end

    def seconds_since(future, past)
      future - past
    end

    def get_followers(bot)
      bot.twitter.followers
    end

    def get_following(bot)
      bot.twitter.following
    end

    # Get all users that we are following
    # but aren't following us so we can
    # unfollow them for privacy
    def diff_followers_to_following(bot)
      follower_names = []
      get_followers(bot).users.each do |user|
        follower_names << user[:screen_name]
      end
      following_names = []
      get_following(bot).users.each do |user|
        following_names << user[:screen_name]
      end
      not_followed_names = []
      following_names.each do |following|
        if !follower_names.include? following
          not_followed_names << following
        end
      end
      not_followed_names
    end

    def unfollow_unfollowers(bot)
      unfollows = diff_followers_to_following(bot)
      if unfollows.length > 0
        puts "No longer followed by these users: " + unfollows.to_s
        puts "Now unfollowing."
        unfollows.each do |unfollow|
          bot.twitter.unfollow(unfollow)
        end
      end
    end

    # We need to randomize what we send because Twitter complains
    # about duplicate responses. Also, it's just nice.
    def random_thank_you
      [
        "Thanks for sharing. I'll post your secret anonymously soon." +
        "You might want to unfollow me - I'll unfollow you, too.",
        "I'll post your message soon. For secrecy, you might want to unfollow me.",
        "Thank you! I'll post your secret soon."
      ].sample
    end

    def run(bot)
      bot.on_startup do
        puts "Ready to go!"
        unfollow_unfollowers(bot)
      end

      bot.on_message do |dm|
        text = dm.text.gsub(/\n+/, '\n')
        Secresea::S3.add_secret text
        bot.reply(dm, random_thank_you)
      end

      # Follow users back
      bot.on_follow do |user|
        puts "Followed by " + user[:screen_name] + "."
        bot.follow(user[:screen_name])
        puts "Following " + user[:screen_name] + "."
        unfollow_unfollowers(bot)
      end

      # Unfollow people who unfollowed us
      bot.scheduler.every '2m' do
        unfollow_unfollowers(bot)
      end

      bot.scheduler.every '1h' do
        secret = Secresea::S3.shift_secret
        if !secret.nil?
          puts "Tweeting secret: " + secret
          bot.tweet(secret)
        end
      end
    end
  end
end