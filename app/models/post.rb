class Post < ApplicationRecord
def redis_access
REDIS.zincrby "posts", 1, self.id
end

def Post.most_popular
  most_popular_posts = REDIS.zrevrange("posts", 0 , 5, withscores: true)
end
end
