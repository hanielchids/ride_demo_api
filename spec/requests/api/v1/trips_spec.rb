require "rails_helper"

RSpec.describe "GET /api/v1/trips", type: :request do
  it "filters by status" do
    create_trip(status: "completed")
    create_trip(status: "scheduled", scheduled_at: 1.hour.from_now)

    get "/api/v1/trips", params: { status: "completed" }

    body = JSON.parse(response.body)
    expect(body.size).to eq(1)
    expect(body.first["status"]).to eq("completed")
  end
end
