class Message < ApplicationRecord
  belongs_to :user
  validates :message, presence: true, length: { minimum: 10 }
end
