require "./federal_register"
require "./twitter_account"
require "./executive_order_processor"

processor = ExecutiveOrderProcessor.new
todays_date = Time.now.strftime("%Y-%m-%d")

FederalRegister.executive_orders_from(todays_date).each do |order|
  processor.process(order)
end
