require "./federal_register"
require "./twitter_account"

twitter_account = TwitterAccount.new
api_results = FederalRegister.backfill["results"]
backfill_tweet_info = []

api_results.each do |result|
  backfill_tweet_info << { title: result["title"], link: result["html_url"] }
end

backfill_tweet_info.each do |info|
  twitter_account.tweet(TwitterAccount.truncate_content(info[:title], info[:link]))
end
