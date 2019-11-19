class Course < ApplicationRecord
  belongs_to :instructor
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :code, :name, :subject, :instructor, presence: true
  validates :code, length: { minimum: 6 }
  validates :name, :subject, length: { minimum: 4 }

end
