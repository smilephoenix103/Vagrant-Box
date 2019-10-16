class Event < ApplicationRecord
  belongs_to :user

  validates :name, :date, :city, :state, presence: true
  validates :date, inclusion: { in: ->(date) { (Date.today..) }, :message => "can't be in past"}
 
end
