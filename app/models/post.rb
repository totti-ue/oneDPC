 class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :user
  has_many :post_themes, dependent: :destroy
  has_many :themes, through: :post_themes

  validates :title, :image, presence: true

  mount_uploader :image, ImageUploader


  def self.search(search)
    return Post.all unless search
    Post.where('title collate utf8_unicode_ci LIKE(?)', "%#{search}%")
  end

  def self.best_post_for_all
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def self.create_today_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).limit(3).pluck(:post_id))
  end

  def self.todays_post
    Post.find(Like.group(:post_id).order('count(post_id) desc').where(created_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day).pluck(:post_id))
  end


end
