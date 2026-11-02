class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :ratings, through: :trips

  validates :name, :vehicle, :plate, presence: true
  validates :plate, uniqueness: true
end
