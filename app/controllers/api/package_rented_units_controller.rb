module Api
  class PackageRentedUnitsController < ApplicationController
    before_action :set_package_rented_unit, only: [:show, :update, :destroy]

    def index
      render json: PackageRentedUnit.all.order('created_at DESC')
    end

    def show
      render json: @package_rented_unit
    end

    def create
      @package_rented_unit = PackageRentedUnit.new(package_rented_unit_params)

      if @package_rented_unit.save
        render json: @package_rented_unit, status: :created
      else
        render json: @package_rented_unit.errors, status: :unprocessable_entity
      end
    end

    def update
      if @package_rented_unit.update(package_rented_unit_params)
        render json: @package_rented_unit, status: :ok
      else
        render json: @package_rented_unit.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @package_rented_unit.destroy
    end

    private
      def set_package_rented_unit
        @package_rented_unit = PackageRentedUnit.find(params[:id])
      end

      def package_rented_unit_params
        params.require(:package_rented_unit).permit(:package_id, :rented_unit_id)
      end
  end
end
