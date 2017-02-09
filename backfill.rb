require "./federal_register"
require "./twitter_account"

api_results = FederalRegister.backfill["results"]
backfill_tweet_info = []

api_results.each do |result|
  backfill_tweet_info << { title: result["title"], link: result["html_url"] }
end

# twitter_account = TwitterAccount.new

# backfill_tweets.each do |tweet_msg|
  # twitter_account.tweet(tweet_msg)
# end

backfill_tweet_info.each do |info|
  puts TwitterAccount.truncate_content(info[:title], info[:link])
end

puts TwitterAccount.truncate_content("Here is a ton of garbage that's definitely over 140 characters I hope because I don't want to type this again what about now come one please truncate", "lololololololgoogle.com")
