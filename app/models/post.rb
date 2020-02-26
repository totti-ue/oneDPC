class Post < ApplicationRecord
  validates :title, :image, presence: true
  belongs_to :user
  has_many  :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

end
