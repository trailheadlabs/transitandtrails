module Api
  module V1
    class TripsController < Api::V1::ApiController
      def index
        @trips = apply_limit_and_offset(params,Trip.order("id"))
      end

      def show
        @trip = Trip.find(params[:id])
      end

      def photos
        @photos = Trip.find(params[:id]).photos
      end

      def maps
        @maps = Trip.find(params[:id]).maps
      end

      def attributes
        @attributes = Trip.find(params[:id]).trip_features
      end

      def route
        @trip = Trip.find(params[:id])
      end

    end
  end
end
