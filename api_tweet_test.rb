require "./federal_register"
require "./twitter_account"

api_results = FederalRegister.test

title = api_results["results"][0]["title"]
url = api_results["results"][0]["html_url"]

twitter_account = TwitterAccount.new
twitter_account.tweet("#{title} #{url}")
