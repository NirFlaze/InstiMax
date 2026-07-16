class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  has_many :following,
         through: :following_relationships,
         source: :following

  has_many :followers,
         through: :followers_relationships,
         source: :follower

  def follow(user)
    following << user unless self == user || following.include?(user)
  end

  def unfollow(user)
    following.destroy(user)
  end

  def following?(user)
    following.include?(user)
  end

  validates :username, presence: true, uniqueness: true
end
