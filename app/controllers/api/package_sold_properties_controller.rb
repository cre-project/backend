module Api
  class PackageSoldPropertiesController < ApplicationController
    before_action :set_package_sold_property, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        render json: PackageSoldProperty.where(package_id: @package.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        @package_sold_property = @package.package_sold_properties.build(package_sold_property_params)

        if @package_sold_property.save
          render json: @package_sold_property, status: :created
        else
          render json: @package_sold_property.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @package = @current_user.packages.find_by(id: package_sold_property_params[:package_id])
      @sold_property = @current_user.sold_properties.find_by(id: package_sold_property_params[:sold_property_id])

      if @current_user.present? && @package.user_id == @current_user.id && @sold_property.user_id == @current_user.id
        @package_sold_property.destroy
      else
        render body: nil, status: :forbidden
      end
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
