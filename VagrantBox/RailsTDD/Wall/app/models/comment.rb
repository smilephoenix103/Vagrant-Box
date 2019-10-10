class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  validates :comment, presence: true, length: { minimum: 10 }
end
