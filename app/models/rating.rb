class Rating < ApplicationRecord
  belongs_to :trip

  validates :score, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 500 }
  validates :trip_id, uniqueness: { message: "has already been rated" }
  validate :trip_must_be_completed

  private

  def trip_must_be_completed
    return if trip.nil? || trip.completed?

    errors.add(:trip, "must be completed before it can be rated")
  end
end