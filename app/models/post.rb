class Post < ApplicationRecord
  validates :title, :image, presence: true
  belongs_to :user
  has_many  :comments

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

end
