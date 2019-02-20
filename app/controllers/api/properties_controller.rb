module Api
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @properties = Property.where(user_id: @current_user.id).as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id])
        render json: @properties
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      if @current_user.present? && @property.user_id == @current_user.id
        render json: @property.as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id])
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @property = @current_user.properties.build(property_params)
        @property.address = Address.create(address_params)

        if @property.save
          render json: @property, status: :created
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      if @current_user.present? && @property.user_id == @current_user.id
        if @property.update(property_params)
          @property.address.update(address_params)
          render json: @property.as_json(include: [address: {except: [ :user_id, :property_id, :properties_id, :sold_properties_id, :addressable_type, :addressable_id ]}], except: [:address_id])
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      if @current_user.present? && @property.user_id == @current_user.id
        @property.destroy
      else
        render body: nil, status: :forbidden
      end
    end

    private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:name, :year_built, :number_of_stories, :lot_size, :apn, :price, :total_square_feet, :package_id, address_attributes: [ :street, :city, :state, :zip ])
    end

    def address_params
      params.require(:property).require(:address).permit(:street, :city, :state, :zip)
    end
  end
end
