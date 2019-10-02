class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :author, presence: true, length: { in: 2..20 }
  validates :message, presence: true, length: { minimum: 5 }
end
