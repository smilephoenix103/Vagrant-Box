class User < ApplicationRecord
  has_secure_password
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_secrets, through: :likes, source: :secret

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
  
end
