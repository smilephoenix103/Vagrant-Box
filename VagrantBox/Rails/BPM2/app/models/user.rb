class User < ApplicationRecord
  has_many :posts
  has_many :messages
  has_many :owners
  has_many :blogs, through: :owners
  has_many :comments, as: :comment_on

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

end
