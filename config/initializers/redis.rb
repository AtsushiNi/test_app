require 'redis'

#uri = URI.parse(ENV["REDIS"])
#REDIS = Redis.new(host: uri.host, port: uri.port)
#@sorted_set = Redis::SortedSet.new('ranking')
REDIS = Redis.new(host: "localhost", port: 6379)
