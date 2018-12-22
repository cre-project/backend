module Api
  class PackageSoldPropertiesController < ApplicationController
    before_action :set_package_sold_property, only: [:show, :update, :destroy]

    def index
      render json: PackageSoldProperty.all.order('created_at DESC')
    end

    def show
      render json: @package_sold_property
    end

    def create
      @package_sold_property = PackageSoldProperty.new(package_sold_property_params)

      if @package_sold_property.save
        render json: @package_sold_property, status: :created
      else
        render json: @package_sold_property.errors, status: :unprocessable_entity
      end
    end

    def update
      if @package_sold_property.update(package_sold_property_params)
        render json: @package_sold_property, status: :ok
      else
        render json: @package_sold_property.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @package_sold_property.destroy
    end

    private
      def set_package_sold_property
        @package_sold_property = PackageSoldProperty.find(params[:id])
      end

      def package_sold_property_params
        params.require(:package_sold_property).permit(:package_id, :sold_property_id)
      end
  end
end
