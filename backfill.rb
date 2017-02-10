require "./federal_register"
require "./executive_order_processor"

processor = ExecutiveOrderProcessor.new

FederalRegister.backfill.each do |executive_order|
  processor.process(executive_order)
end
