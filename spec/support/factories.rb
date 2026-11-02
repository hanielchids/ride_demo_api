# Tiny hand-rolled factories so the demo has no extra gems.
module Factories
  def create_driver(**attrs)
    Driver.create!({ name: "Test Driver", vehicle: "Toyota Quantum", plate: "TEST #{rand(100..999)} GP" }.merge(attrs))
  end

  def create_passenger(**attrs)
    Passenger.create!({ name: "Test Passenger", email: "passenger#{rand(10_000)}@example.com" }.merge(attrs))
  end

  def create_trip(status: "completed", driver: create_driver, passenger: create_passenger, **attrs)
    Trip.create!({
      driver:, passenger:, status:,
      pickup: "A", dropoff: "B",
      scheduled_at: 2.hours.ago,
      completed_at: (status == "completed" ? 1.hour.ago : nil)
    }.merge(attrs))
  end
end

RSpec.configure { |c| c.include Factories }
