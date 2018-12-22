module Api
  class PropertyUnitsController < ApplicationController
    before_action :set_property_unit, only: [:show, :update, :destroy]

    def index
      render json: PropertyUnit.all
    end

    def create
      @property_unit = PropertyUnit.new(property_unit_params)

      if @property_unit.save
        render json: @property_unit, status: :created
      else
        render json: @property_unit.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @property_unit.destroy
    end

    private
      def set_property_unit
        @property_unit = PropertyUnit.find(params[:id])
      end

      def property_unit_params
        params.require(:property_unit).permit(:bedrooms, :bathrooms, :current_rent, :potential_rent, :property_id)
      end
  end
end
