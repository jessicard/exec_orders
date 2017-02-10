task default: %w(test)

task :test do
  ruby "test.rb"
end

namespace :backfill do
  desc "Log the results of the backfill locally"
  task :log do
    ruby "backfill.rb log"
  end

  desc "Backfill the Twitter account"
  task :twitter do
    ruby "backfill.rb twitter"
  end
end

task :clear_registry do
  ruby "clear_registry.rb"
end

task :test_executive_order_registry do
  ruby "executive_order_registry_test.rb"
end

task :process_executive_orders_from_today do
  ruby "process_executive_orders_from_today.rb"
end
