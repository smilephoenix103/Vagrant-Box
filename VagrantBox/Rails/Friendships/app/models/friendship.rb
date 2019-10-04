class Friendship < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'

  after_create :create_inverse

  def create_inverse
    self.class.create(user_id: self.friend.id, friend_id: self.user.id)
  end

  validates_uniqueness_of :user_id, scope: :friend_id
end
