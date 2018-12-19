module Api
  class PropertyUnitsController < ApplicationController
    before_action :set_property_unit, only: [:show, :update, :destroy]

    # GET /property_units
    def index
      @property_units = PropertyUnit.all

      render json: @property_units
    end

    # POST /property_units
    def create
      @property_unit = PropertyUnit.new(property_unit_params)

      if @property_unit.save
        render json: @property_unit, status: :created, location: @property_unit
      else
        render json: @property_unit.errors, status: :unprocessable_entity
      end
    end

    # DELETE /property_units/1
    def destroy
      @property_unit.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property_unit
        @property_unit = PropertyUnit.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def property_unit_params
        params.require(:property_unit).permit(:bedrooms, :bathrooms, :current_rent, :potential_rent, :property_id)
      end
  end
end
