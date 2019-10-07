class Student < ApplicationRecord
  belongs_to :dojo

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :dojo, presence: true 
  
  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

end
