class Student < ApplicationRecord
  belongs_to :user

  has_many :registrations, dependent: :destroy
  has_many :courses, through: :registrations
end
