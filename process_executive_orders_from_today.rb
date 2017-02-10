require "./federal_register"
require "./twitter_account"

processor = ExecutiveOrderProcessor.new(:twitter)
todays_date = Time.now.strftime("%Y-%m-%d")

FederalRegister.executive_orders_from(todays_date).each do |order|
  processor.process(order)
end
