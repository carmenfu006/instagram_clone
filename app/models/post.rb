class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :post_photo
  has_many :comments, dependent: :destroy
end
