class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userが削除される同時に、userに関連するposts,comments,likesも削除される。
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post

  validates :nickname, presence: true

  mount_uploader :avator, ImageUploader


  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end


end
