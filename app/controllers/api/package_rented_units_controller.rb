module Api
  class PackageRentedUnitsController < ApplicationController
    before_action :set_package_rented_unit, only: [:show, :update, :destroy]

    def show
      @package = @current_user.packages.find_by(id: package_rented_unit_params[:package_id])
      @rented_unit = @current_user.rented_units.find_by(id: package_rented_unit_params[:rented_unit_id])
      if @current_user.present? && @package.user_id == @current_user.id && @rented_unit.user_id == @current_user.id
        render json: @package_rented_unit
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        binding.pry
        @package = @current_user.packages.find_by(id: package_rented_unit_params[:package_id])
        @rented_unit = @current_user.rented_units.find_by(id: package_rented_unit_params[:rented_unit_id])
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

    def update
      @package = @current_user.packages.find_by(id: package_rented_unit_params[:package_id])
      @rented_unit = @current_user.rented_units.find_by(id: package_rented_unit_params[:rented_unit_id])

      if @current_user.present? && @package.user_id == @current_user.id && @rented_unit.user_id == @current_user.id
        if @package_rented_unit.update(package_rented_unit_params)
          render json: @package_rented_unit, status: :ok
        else
          render json: @package_rented_unit.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @package = @current_user.packages.find_by(id: package_rented_unit_params[:package_id])
      @rented_unit = @current_user.rented_units.find_by(id: package_rented_unit_params[:rented_unit_id])

      if @current_user.present? && @package.user_id == @current_user.id && @rented_unit.user_id == @current_user.id
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
