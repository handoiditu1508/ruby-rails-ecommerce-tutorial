class User < ApplicationRecord
  belongs_to :role
  has_one :student, dependent: :destroy

  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
