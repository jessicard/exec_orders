require "redis"

class ExecutiveOrderRegistry
  DOCUMENT_NUMBERS_KEY = "document_numbers"

  def register(executive_order)
    if ENV["DEVELOPMENT"]
      puts "Register!"
    else
      redis_client.sadd(DOCUMENT_NUMBERS_KEY, executive_order.document_number)
    end
  end

  def registered?(executive_order)
    !!redis_client.sismember(DOCUMENT_NUMBERS_KEY, executive_order.document_number)
  end

  def clear
    redis_client.del(DOCUMENT_NUMBERS_KEY)
  end

  private

  def redis_client
    @redis_client ||= if ENV["REDIS_URL"]
      Redis.new(url: ENV["REDIS_URL"])
    else
      Redis.new
    end
  end
end
