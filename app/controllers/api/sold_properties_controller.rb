module Api
  class SoldPropertiesController < ApplicationController
    before_action :set_sold_property, only: [:show, :update, :destroy]

    def index
      render json: SoldProperty.all
    end

    def show
      render json: @sold_property
    end

    def create
      @sold_property = SoldProperty.new(sold_property_params)

      if @sold_property.save
        render json: @sold_property, status: :created
      else
        render json: @sold_property.errors, status: :unprocessable_entity
      end
    end

    def update
      if @sold_property.update(sold_property_params)
        render json: @sold_property, status: :ok
      else
        render json: @sold_property.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @sold_property.destroy
    end

    private
      def set_sold_property
        @sold_property = SoldProperty.find(params[:id])
      end

      def sold_property_params
        params.require(:sold_property).permit(:year_built, :sales_price, :num_units, :square_feet, :cap_rate, :grm, :close_of_escrow, :image_url, :user_id, :address_id)
      end
  end
end
