require "rails_helper"

RSpec.describe "GET /api/v1/drivers", type: :request do
  it "lists drivers with their completed trip count" do
    driver = create_driver(name: "Alpha")
    create_trip(driver:, status: "completed")
    create_trip(driver:, status: "cancelled")

    get "/api/v1/drivers"

    expect(response).to have_http_status(:ok)
    body = JSON.parse(response.body)
    expect(body.first).to include("name" => "Alpha", "completed_trips" => 1)
  end

  it "returns 404 for an unknown driver" do
    get "/api/v1/drivers/999"
    expect(response).to have_http_status(:not_found)
  end

  it "exposes the driver's average rating and count" do
    driver = create_driver
    Rating.create!(trip: create_trip(driver:), score: 5)
    Rating.create!(trip: create_trip(driver:), score: 4)

    get "/api/v1/drivers/#{driver.id}"

    expect(JSON.parse(response.body)).to include("average_rating" => 4.5, "ratings_count" => 2)
  end
end
