class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :events_joined, dependent: :destroy
  has_many :comments, dependent: :destroy


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, presence: true, length: { minimum: 2 }
  validates :state, presence: true
  validates :email, presence:true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

end
