require "./federal_register"
require "./executive_order_processor"

processor = ExecutiveOrderProcessor.new(ARGV.first.to_sym)

FederalRegister.backfill.each do |executive_order|
  processor.process(executive_order)
end
