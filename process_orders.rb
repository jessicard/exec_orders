require "rubygems"
require "pp"

require "./federal_register"
require "./twitter_account"

twitter_account = TwitterAccount.new
todays_date = Time.now.strftime("%Y-%m-%d")
api_results = FederalRegister.executive_orders_from(todays_date)["results"]

if api_results
  api_results.each do |result|
    twitter_account.tweet(TwitterAccount.truncate_content(result["title"], result["html_url"]))
  end
end
