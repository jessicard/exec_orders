require "./executive_order"
require "./executive_order_registry"

orders = [
  ExecutiveOrder.from_federal_register_hash(
    "title" => "First executive order",
    "document_number" => "111",
    "html_url" => "google.com"
  ),
  ExecutiveOrder.from_federal_register_hash(
    "title" => "Second executive order",
    "document_number" => "222",
    "html_url" => "altavista.com"
  )
]

registry = ExecutiveOrderRegistry.new

orders.each do |order_to_register|
  orders.each do |order|
    puts "#{order.title.inspect} registered? #{registry.registered?(order).inspect}"
  end

  puts "registering #{order_to_register}"
  registry.register(order_to_register)

  orders.each do |order|
    puts "#{order.title.inspect} registered? #{registry.registered?(order).inspect}"
  end

  puts "--------"
end

registry.clear
