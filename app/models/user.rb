class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :following_relationships,
         class_name: "Follow",
         foreign_key: "follower_id",
         dependent: :destroy

  has_many :followers_relationships,
         class_name: "Follow",
         foreign_key: "following_id",
         dependent: :destroy
end
