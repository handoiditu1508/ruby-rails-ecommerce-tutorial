class Student < ApplicationRecord
  belongs_to :user

  has_many :registrations
  has_many :courses, through: :registrations
end
