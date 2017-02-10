require "./twitter_account"
require "./executive_order_registry"

class ExecutiveOrderProcessor
  def process(executive_order)
    return if registry.registered?(executive_order)

    tweet = TwitterAccount.truncate_content(executive_order.title, executive_order.url)

    twitter_account.tweet(tweet)
    registry.register(executive_order)
  end

  private

  def registry
    @registry ||= ExecutiveOrderRegistry.new
  end

  def twitter_account
    @twitter_account ||= TwitterAccount.new
  end
end
