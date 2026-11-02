module Api
  module V1
    class DriversController < ApplicationController
      def index
        render json: Driver.order(:name).map { |d| DriverSerializer.new(d).as_json }
      end

      def show
        render json: DriverSerializer.new(Driver.find(params[:id])).as_json
      end
    end
  end
end
