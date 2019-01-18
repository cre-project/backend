module Api
  class PackageRentedUnitsController < ApplicationController
    before_action :set_package_rented_unit, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        render json: PackageRentedUnit.where(package_id: @package.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        @package_rented_unit = @package.package_rented_units.build(package_rented_unit_params)

        if @package_rented_unit.save
          render json: @package_rented_unit, status: :created
        else
          render json: @package_rented_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @package = @current_user.packages.find_by(id: params[:package_id])

      if @current_user.present? && @package.user_id == @current_user.id
        @package_rented_unit.destroy
      else
        render body: nil, status: :forbidden
      end
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
