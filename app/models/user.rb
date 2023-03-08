class User < ApplicationRecord
  belongs_to :role
  has_one :student, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
