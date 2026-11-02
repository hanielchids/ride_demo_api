# Fictional seed data only. All names, plates and places are invented.
Trip.delete_all
Driver.delete_all
Passenger.delete_all

drivers = [
  ["Thandi Mokoena", "Toyota Quantum", "DEMO 101 GP"],
  ["Pieter van Wyk", "Hyundai H1", "DEMO 202 GP"],
  ["Nomsa Dlamini", "VW Transporter", "DEMO 303 GP"]
].map { |name, vehicle, plate| Driver.create!(name:, vehicle:, plate:) }

passengers = [
  ["Lerato Khumalo", "lerato@example.com"],
  ["Sipho Nkosi", "sipho@example.com"],
  ["Anele Mthembu", "anele@example.com"],
  ["Johan Botha", "johan@example.com"],
  ["Zanele Cele", "zanele@example.com"]
].map { |name, email| Passenger.create!(name:, email:) }

places = ["Riverside Park", "Central Station", "Oakfield Campus", "Harbour Gate", "Hillcrest Mall", "Greenway Offices"]

now = Time.current
30.times do |i|
  driver = drivers[i % drivers.size]
  passenger = passengers[i % passengers.size]
  pickup, dropoff = places.sample(2)
  status =
    case i % 6
    when 0, 1, 2 then "completed"
    when 3 then "cancelled"
    when 4 then "in_progress"
    else "scheduled"
    end
  scheduled_at = status == "scheduled" ? now + (i + 1).hours : now - (i + 1).hours
  completed_at = status == "completed" ? scheduled_at + 35.minutes : nil

  Trip.create!(driver:, passenger:, pickup:, dropoff:, status:, scheduled_at:, completed_at:)
end

puts "Seeded #{Driver.count} drivers, #{Passenger.count} passengers, #{Trip.count} trips (#{Trip.completed.count} completed)."
