class Trip < ApplicationRecord
  STATUSES = %w[scheduled in_progress completed cancelled].freeze

  belongs_to :driver
  belongs_to :passenger
  has_one :rating, dependent: :destroy

  validates :pickup, :dropoff, :scheduled_at, presence: true
  validates :status, inclusion: { in: STATUSES }

  scope :completed, -> { where(status: "completed") }

  def completed? = status == "completed"
end
