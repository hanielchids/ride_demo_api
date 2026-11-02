class DriverSerializer
  def initialize(driver) = @driver = driver

  def as_json(*)
    {
      id: @driver.id,
      name: @driver.name,
      vehicle: @driver.vehicle,
      plate: @driver.plate,
      completed_trips: @driver.trips.completed.count
      # During the recording: add average_rating here.
    }
  end
end
