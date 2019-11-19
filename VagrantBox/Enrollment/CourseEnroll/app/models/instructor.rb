class Instructor < ApplicationRecord
  has_secure_password
  has_many :courses, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitivity: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

end
