class DriverSerializer
  def initialize(driver) = @driver = driver

  def as_json(*)
    {
      id: @driver.id,
      name: @driver.name,
      vehicle: @driver.vehicle,
      plate: @driver.plate,
      completed_trips: @driver.trips.completed.count,
      average_rating: @driver.ratings.average(:score)&.to_f&.round(1),
      ratings_count: @driver.ratings.count
    }
  end
end
