class RentedUnitsController < ApplicationController
  before_action :set_rented_unit, only: [:show, :update, :destroy]

  # GET /rented_units
  def index
    @rented_units = RentedUnit.all

    render json: @rented_units
  end

  # GET /rented_units/1
  def show
    render json: @rented_unit
  end

  # POST /rented_units
  def create
    @rented_unit = RentedUnit.new(rented_unit_params)

    if @rented_unit.save
      render json: @rented_unit, status: :created, location: @rented_unit
    else
      render json: @rented_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rented_units/1
  def update
    if @rented_unit.update(rented_unit_params)
      render json: @rented_unit
    else
      render json: @rented_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rented_units/1
  def destroy
    @rented_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rented_unit
      @rented_unit = RentedUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rented_unit_params
      params.require(:rented_unit).permit(:name, :year_built, :rent, :bedrooms, :bathrooms, :sales_price, :num_units, :price_per_unit, :price_per_sf, :cap_rate, :grm, :close_of_escrow, :image_url)
    end
end
