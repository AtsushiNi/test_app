class Post < ApplicationRecord
def redis_access
REDIS.zincrby "posts", 1, self.id
end

def Post.most_popular
  most_popular_posts = REDIS.zrevrangebyscore "posts","+inf", 0, limit: [0, 5]
  #where(id: most_popular_posts).sort_by{ |post| most_popular_posts.index(post.id.to_s)}
end
end
