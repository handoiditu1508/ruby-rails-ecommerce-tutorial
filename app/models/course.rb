class Course < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :students, through: :registrations
end
