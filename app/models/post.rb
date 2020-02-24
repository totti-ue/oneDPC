class Post < ApplicationRecord
  validates :title, :image, presence: true
  belongs_to :user
  has_many  :comments
end
