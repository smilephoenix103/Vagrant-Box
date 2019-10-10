class User < ApplicationRecord
    has_many :messages
    has_many :comments
    validates :username, presence: true, length: { minimum: 5 }
end
