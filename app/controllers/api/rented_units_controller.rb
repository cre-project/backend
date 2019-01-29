module Api
  class RentedUnitsController < ApplicationController
    before_action :set_rented_unit, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        render json: RentedUnit.where(user_id: @current_user.id).as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id]), status: :ok
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      if @current_user.present? && @rented_unit.user_id == @current_user.id
        render json: @rented_unit.as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id]), status: :ok
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @rented_unit = @current_user.rented_units.build(rented_unit_params)
        @rented_unit.address = Address.create(address_params)

        if @rented_unit.save
          render json: @rented_unit.as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id]), status: :created
        else
          render json: @rented_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      if @current_user.present? && @rented_unit.user_id == @current_user.id
        if @rented_unit.update(rented_unit_params)
          render json: @rented_unit.as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id]), status: :ok        else
          render json: @rented_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      if @current_user.present? && @rented_unit.user_id == @current_user.id
        @package_rented_units = PackageRentedUnit.where(rented_unit_id: @rented_unit.id)
        @package_rented_units.each do |pru|
          pru.destroy
        end
        @rented_unit.destroy
        render json: @rented_unit, status: :ok
      else
        render body: nil, status: :forbidden
      end
    end

    private
      def set_rented_unit
        @rented_unit = RentedUnit.find(params[:id])
      end

      def rented_unit_params
        params.require(:rented_unit).permit(:year_built, :bedrooms, :bathrooms, :current_rent, :image_url, address_attributes: [ :street, :city, :state, :zip ])
      end

      def address_params
        params.require(:rented_unit).require(:address).permit(:street, :city, :state, :zip)
      end
  end
end
