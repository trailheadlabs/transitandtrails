module Api
  module V1
    class CampgroundsController < Api::V1::ApiController

      caches_action :index, :expires_in => 60, :cache_path => Proc.new { |c| c.params }

      def index
        @campgrounds = Campground.order("id").includes(:cached_park_by_bounds,:park)
        if params[:non_profit_partner_id]
          partner_id = params[:non_profit_partner_id]
          parks = Park.where(:non_profit_partner_id => partner_id)
          campground_ids = parks.collect{|p| p.campgrounds }.flatten
          
          attribute_id = params[:attribute_id]
          if attribute_id
            @campgrounds = CampgroundFeature.find(attribute_id).campgrounds.where(id:campground_ids)
          else
            @campgrounds = Campground.where(id:campground_ids)
          end
        end

        if(params[:latitude] && params[:longitude])
          distance = params[:distance] || 100
          @campgrounds = @campgrounds.near([params[:latitude],params[:longitude]],distance)
        end
        
        @campgrounds = apply_limit_and_offset(params,@campgrounds.order('id'))
      end

      def show
        @campground = Campground.find(params[:id])
      end

      def photos
        @photos = Campground.find(params[:id]).photos
      end

      def maps
        @maps = Campground.find(params[:id]).maps
      end

      def attributes
        @attributes = Campground.find(params[:id]).campground_features
      end

    end
  end
end
