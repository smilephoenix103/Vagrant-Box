class Enrollment < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :student, dependent: :destroy
end
