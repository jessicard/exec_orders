require "rubygems"
require "dotenv/load"
require "twitter"

class TwitterAccount
  CONVERTED_LINK_LENGTH = 22
  MAX_TWEET_LENGTH = 140
  SPACE_LENGTH = 1

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def tweet(msg)
    @client.update(msg)
  end

  def self.truncate_content(title, link)
    tweet_length = title.length + CONVERTED_LINK_LENGTH + SPACE_LENGTH
    truncated_title = title

    if tweet_length > MAX_TWEET_LENGTH
      difference = (tweet_length - MAX_TWEET_LENGTH) + (CONVERTED_LINK_LENGTH + SPACE_LENGTH)

      truncated_title = title.truncate(MAX_TWEET_LENGTH - difference)
    end

    "#{truncated_title} #{link}"
  end
end

class String
  def truncate(truncate_at, options = {})
    return dup unless length > truncate_at

    options[:omission] ||= '...'
    length_with_room_for_omission = truncate_at - options[:omission].length
    stop = if options[:separator]
        rindex(options[:separator], length_with_room_for_omission) || length_with_room_for_omission
      else
        length_with_room_for_omission
      end

    "#{self[0...stop]}#{options[:omission]}"
  end
end
