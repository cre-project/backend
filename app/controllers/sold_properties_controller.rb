class SoldPropertiesController < ApplicationController
  before_action :set_sold_property, only: [:show, :update, :destroy]

  # GET /sold_properties
  def index
    @sold_properties = SoldProperty.all

    render json: @sold_properties
  end

  # GET /sold_properties/1
  def show
    render json: @sold_property
  end

  # POST /sold_properties
  def create
    @sold_property = SoldProperty.new(sold_property_params)

    if @sold_property.save
      render json: @sold_property, status: :created, location: @sold_property
    else
      render json: @sold_property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sold_properties/1
  def update
    if @sold_property.update(sold_property_params)
      render json: @sold_property
    else
      render json: @sold_property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sold_properties/1
  def destroy
    @sold_property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sold_property
      @sold_property = SoldProperty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sold_property_params
      params.require(:sold_property).permit(:year_built, :sales_price, :num_units, :square_feet, :cap_rate, :grm, :close_of_escrow, :image_url, :user_id, :address_id)
    end
end
