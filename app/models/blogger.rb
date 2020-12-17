class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts


  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, { :length => {:minimum => 30}}
  
  # def featured_post
  #   self.posts.max_by {|post| post.likes} 
  # end

  def featured_post
    self.posts.order(likes: :DESC).first
  end



  # def most_posts_destinations
  #   hash = Hash.new(0)
  #   self.posts.each { |post| hash[post.destination_id] += 1}
  #   list_destination_ids = hash.sort_by {|k,v| v}.last(5).map {|array| array[0]}.reverse
  #   list_destination_ids.map {|id| Destination.find(id)}
  # end

    def most_posts_destinations
      self.posts.group(:destination).order('count_id desc').count('id').keys.first(5)
    end
end
