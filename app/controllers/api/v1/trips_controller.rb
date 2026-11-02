module Api
  module V1
    class TripsController < ApplicationController
      def index
        trips = Trip.includes(:driver, :passenger).order(scheduled_at: :desc)
        trips = trips.where(status: params[:status]) if params[:status].present?
        render json: trips.map { |t| TripSerializer.new(t).as_json }
      end

      def show
        render json: TripSerializer.new(Trip.find(params[:id])).as_json
      end
    end
  end
end
