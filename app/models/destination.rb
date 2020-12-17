class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts


  # def featured_post
  #   self.posts.max_by {|post| post.likes} 
  # end

  def featured_post
    self.posts.order(likes: :DESC).first
  end

  # def average_age_bloggers
  #   self.bloggers.uniq.sum {|blogger| blogger.age} / self.bloggers.uniq.size.to_f
  # end
  

  def average_age_bloggers
    self.bloggers.distinct.sum(:age) / self.bloggers.distinct.size.to_f
  end
  
end
