require "./federal_register"
require "./twitter_account"

twitter_account = TwitterAccount.new
api_results = FederalRegister.backfill["results"]

api_results.each do |result|
  twitter_account.tweet(TwitterAccount.truncate_content(result["title"], result["html_url"]))
end
