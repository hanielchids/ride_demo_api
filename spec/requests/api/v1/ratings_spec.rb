require "rails_helper"

RSpec.describe "POST /api/v1/trips/:trip_id/rating", type: :request do
  let(:trip) { create_trip(status: "completed") }

  it "creates a rating for a completed trip" do
    post "/api/v1/trips/#{trip.id}/rating", params: { rating: { score: 5, comment: "Smooth trip" } }

    expect(response).to have_http_status(:created)
    expect(JSON.parse(response.body)).to include("score" => 5, "trip_id" => trip.id)
  end

  it "rejects a trip that is not completed" do
    trip = create_trip(status: "scheduled", scheduled_at: 1.hour.from_now)

    post "/api/v1/trips/#{trip.id}/rating", params: { rating: { score: 4 } }

    expect(response).to have_http_status(:unprocessable_entity)
    expect(JSON.parse(response.body)["errors"].join).to include("completed")
  end

  it "rejects a second rating for the same trip" do
    post "/api/v1/trips/#{trip.id}/rating", params: { rating: { score: 5 } }
    post "/api/v1/trips/#{trip.id}/rating", params: { rating: { score: 3 } }

    expect(response).to have_http_status(:unprocessable_entity)
    expect(trip.reload.rating.score).to eq(5)
  end

  it "rejects a score outside 1 to 5" do
    post "/api/v1/trips/#{trip.id}/rating", params: { rating: { score: 9 } }

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
