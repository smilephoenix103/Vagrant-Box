class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_many :messages

  validates :title, presence: true, length: { in: 2..20 }
  validates :content, presence: true, length: { minimum: 5 }
end
