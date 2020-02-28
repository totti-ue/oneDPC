class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :post_themes, dependent: :destroy
  has_many :themes, through: :post_themes

  validates :title, :image, presence: true

  mount_uploader :image, ImageUploader


  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def self.create_today_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).limit(3).pluck(:post_id))
  end

end
