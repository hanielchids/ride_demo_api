class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, :vehicle, :plate, presence: true
  validates :plate, uniqueness: true
end
