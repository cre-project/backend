module Api
  class PropertyUnitsController < ApplicationController
    before_action :set_property_unit, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @property = @current_user.properties.find_by(id: params[:property_id])
        render json: PropertyUnit.where(property_id: @property.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @property = @current_user.properties.find_by(id: params[:property_id])
        @property_unit = @property.property_units.build(property_unit_params)

        if @property.save && @property_unit.save
          render json: @property_unit, status: :created
        else
          render json: @property_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      @property = @current_user.properties.find_by(id: params[:property_id])
      if @current_user.present? && @property.user_id == @current_user.id
        if @property_unit.update(property_unit_params)
          render json: @property_unit, status: :ok
        else
          render json: @property_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @property = @current_user.properties.find_by(id: params[:property_id])

      if @current_user.present? && @property.user_id == @current_user.id
        @property_unit.destroy
      else
        render body: nil, status: :forbidden
      end
    end

    private
      def set_property_unit
        @property_unit = PropertyUnit.find(params[:id])
      end

      def property_unit_params
        params.require(:property_unit).permit(:bedrooms, :bathrooms, :current_rent, :potential_rent)
      end
  end
end
