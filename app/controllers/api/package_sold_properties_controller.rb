module Api
  class PackageSoldPropertiesController < ApplicationController
    before_action :set_package_sold_property, only: [:show, :update, :destroy]

    # GET /package_sold_properties
    # GET /package_sold_properties.json
    def index
      @package_sold_properties = PackageSoldProperty.all.order('created_at DESC')

      render json: @package_sold_properties
    end

    # GET /package_sold_properties/1
    # GET /package_sold_properties/1.json
    def show
      render json: @package_sold_property
    end

    # POST /package_sold_properties
    # POST /package_sold_properties.json
    def create
      @package_sold_property = PackageSoldProperty.new(package_sold_property_params)

      if @package_sold_property.save
        render json: @package_sold_property, status: :created, location: @package_sold_property
      else
        render json: @package_sold_property.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /package_sold_properties/1
    # PATCH/PUT /package_sold_properties/1.json
    def update
      if @package_sold_property.update(package_sold_property_params)
        render json: @package_sold_property, status: :ok, location: @package_sold_property
      else
        render json: @package_sold_property.errors, status: :unprocessable_entity
      end
    end

    # DELETE /package_sold_properties/1
    # DELETE /package_sold_properties/1.json
    def destroy
      @package_sold_property.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_package_sold_property
        @package_sold_property = PackageSoldProperty.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def package_sold_property_params
        params.require(:package_sold_property).permit(:package_id, :sold_property_id)
      end
  end
end
