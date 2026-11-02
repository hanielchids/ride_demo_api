class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
