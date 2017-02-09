require "./federal_register"
require "./twitter_client"

api_results = FederalRegister.test

title = api_results["results"][0]["title"]
url = api_results["results"][0]["html_url"]

twitter_instance = TwitterClient.new
twitter_instance.tweet("#{title} #{url}")
