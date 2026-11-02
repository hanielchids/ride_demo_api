class TripSerializer
  def initialize(trip) = @trip = trip

  def as_json(*)
    {
      id: @trip.id,
      status: @trip.status,
      pickup: @trip.pickup,
      dropoff: @trip.dropoff,
      scheduled_at: @trip.scheduled_at,
      completed_at: @trip.completed_at,
      driver: { id: @trip.driver_id, name: @trip.driver.name },
      passenger: { id: @trip.passenger_id, name: @trip.passenger.name }
    }
  end
end
