class User < ApplicationRecord
  has_secure_password

  has_one_attached :profile_picture
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  # when current_user clicks button follow then it will set self id to be the follower_id

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  # when a user id is saved in as following_id, which means this user is being followed

  has_many :followings, through: :active_relationships
  # current_user.followings -> shows all the users that this current_user is following (array)

  has_many :followers, through: :passive_relationships
  # current_user.followers -> shows all the users who follows current_user (array)
end
