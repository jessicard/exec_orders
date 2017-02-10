require "rubygems"
require "dotenv/load"
require "faraday"
require "json"
require "twitter"

class TwitterAccount
  CONVERTED_LINK_LENGTH = 22
  MAX_TWEET_LENGTH = 140
  # +1 to account for space length between title and link
  MAX_TITLE_LENGTH = MAX_TWEET_LENGTH - (CONVERTED_LINK_LENGTH + 1)

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
    truncated_title = if title.size <= MAX_TITLE_LENGTH
      title
    else
      # -1 to account for ellipsis length
      title[0, MAX_TITLE_LENGTH - 1] + "…"
    end

    "#{truncated_title} #{link}"
  end
end
