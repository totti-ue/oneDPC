class Post < ApplicationRecord
  validates :title, :image, presence: true
  belongs_to :user
end
