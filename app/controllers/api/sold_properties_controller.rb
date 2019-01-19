module Api
  class SoldPropertiesController < ApplicationController
    before_action :set_sold_property, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        render json: SoldProperty.where(user_id: @current_user.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      if @current_user.present? && @sold_property.user_id == @current_user.id
        render json: @sold_property
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @sold_property = @current_user.sold_properties.build(sold_property_params)
        @sold_property.address = Address.create(address_params)

        if @sold_property.save
          render json: @sold_property, status: :created
        else
          render json: @sold_property.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      if @sold_property.present? && @sold_property.user_id == @current_user.id
        if @sold_property.update(sold_property_params)
          render json: @sold_property, status: :ok
        else
          render json: @sold_property.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      if @current_user.present? && @sold_property.user_id == @current_user.id
        @sold_property.destroy
      else
        render body: nil, status: :forbidden
      end
    end

    private
      def set_sold_property
        @sold_property = SoldProperty.find(params[:id])
      end

      def sold_property_params
        params.require(:sold_property).permit(:year_built, :sales_price, :num_units, :square_feet, :cap_rate, :grm, :close_of_escrow, :image_url, address_attributes: [ :street, :city, :state, :zip ])
      end

      def address_params
        params.require(:sold_property).require(:address).permit(:street, :city, :state, :zip)
      end
  end
end
