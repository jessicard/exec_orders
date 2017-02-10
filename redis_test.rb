require "redis"

redis = Redis.new

begin
  redis.ping
  puts "found redis!"

  redis.set("most_recent_ping", Time.now.strftime("%l:%M:%S%P, %A, %B%e, %Y").strip)
  puts "Stored '#{redis.get("most_recent_ping")}' as the most recent ping."
rescue Exception => e
  puts e.inspect
end
