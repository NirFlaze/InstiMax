class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  validates :follower_id,
            uniqueness: {
              scope: :following_id
            }

  validate :cannot_follow_yourself

  private

  def cannot_follow_yourself
    if follower_id == following_id
      errors.add(:following_id, "Нельзя подписаться на самого себя")
    end
  end
end
