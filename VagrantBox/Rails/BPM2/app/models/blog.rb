class Blog < ApplicationRecord
  has_many :posts
  has_many :owners
  has_many :users, through: :owners
  has_many :messages, through: :posts

  validates :name, presence: true, length: { in: 2..20 }
  validates :description, presence: true, length: { minimum: 5 }
end
