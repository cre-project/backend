module Api
  class RentedUnitsController < ApplicationController
    before_action :set_rented_unit, only: [:show, :update, :destroy]

    def index
      render json: RentedUnit.all
    end

    def show
      render json: @rented_unit
    end

    def create
      @rented_unit = RentedUnit.new(rented_unit_params)

      if @rented_unit.save
        render json: @rented_unit, status: :created
      else
        render json: @rented_unit.errors, status: :unprocessable_entity
      end
    end

    def update
      if @rented_unit.update(rented_unit_params)
        render json: @rented_unit, status: :ok
      else
        render json: @rented_unit.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @rented_unit.destroy
    end

    private
      def set_rented_unit
        @rented_unit = RentedUnit.find(params[:id])
      end

      def rented_unit_params
        params.require(:rented_unit).permit(:year_built, :bedrooms, :bathrooms, :current_rent, :image_url, :user_id, :address_id)
      end
  end
end
