module Api
  module V1
    class RatingsController < ApplicationController
      def create
        trip = Trip.find(params[:trip_id])
        rating = Rating.new(rating_params)
        rating.trip = trip

        if rating.save
          render json: RatingSerializer.new(rating).as_json, status: :created
        else
          render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rating_params
        params.require(:rating).permit(:score, :comment)
      end
    end
  end
end
