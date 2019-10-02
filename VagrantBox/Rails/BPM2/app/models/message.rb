class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :comment_on

  validates :author, presence: true, length: { in: 2..20 }
  validates :message, presence: true, length: { minimum: 5 }
end
