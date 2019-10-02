class User < ApplicationRecord
  has_one :address
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 10, less_than: 150 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email
  after_create :successfully_created
  after_update :successfully_updated

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.average_age
    self.sum(:age) / self.count
  end

  private
  def downcase_email
    self.email.downcase!
  end

  def successfully_created
    puts "Successfully created a new user"
  end

  def successfully_updated
    puts "Successfully updated a existing user"
  end

end
