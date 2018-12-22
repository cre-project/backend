module Api
  class PackageRentedUnitsController < ApplicationController
    before_action :set_package_rented_unit, only: [:show, :update, :destroy]

    # GET /package_rented_units
    # GET /package_rented_units.json
    def index
      @package_rented_units = PackageRentedUnit.all.order('created_at DESC')

      render json: @package_rented_units
    end

    # GET /package_rented_units/1
    # GET /package_rented_units/1.json
    def show
      render json: @package_rented_unit
    end

    # POST /package_rented_units
    # POST /package_rented_units.json
    def create
      @package_rented_unit = PackageRentedUnit.new(package_rented_unit_params)

      if @package_rented_unit.save
        render json: @package_rented_unit, status: :ok, location: @package_rented_unit
      else
        render json: @package_rented_unit.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /package_rented_units/1
    # PATCH/PUT /package_rented_units/1.json
    def update
      if @package_rented_unit.update(package_rented_unit_params)
        render json: @package_rented_unit, status: :ok, location: @package_rented_unit
      else
        render json: @package_rented_unit.errors, status: :unprocessable_entity
      end
    end

    # DELETE /package_rented_units/1
    # DELETE /package_rented_units/1.json
    def destroy
      @package_rented_unit.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_package_rented_unit
        @package_rented_unit = PackageRentedUnit.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def package_rented_unit_params
        params.require(:package_rented_unit).permit(:package_id, :rented_unit_id)
      end
  end
end
