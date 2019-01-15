module Api
  class PackagesController < ApplicationController
    before_action :set_package, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request

    def index
      if @current_user.present?
        render json: Package.where(user_id: @current_user.id)
      else
        render body: nil, status: :forbidden
      end
    end

    # def show
    #   if @current_user.present? && @package.user_id == @current_user.id
    #     render json: { package: @package }
    #   else
    #     render body: nil, status: :forbidden
    #   end
    # end

    def show
      render json:
      {
        package: {
          package: @package,
          property: @package.property,
          property_units: @package.property.property_units,
          package_sold_properties: @package.package_sold_properties,
          package_rented_units: @package.package_rented_units,
          operating_statement: @package.operating_statements
        },
        user: {
          user: @package.user,
          company: @package.user.company,
          addresses: @package.user.addresses
        }
      }
    end

    def create
      if @current_user.present?
        @package = @current_user.packages.build(package_params)

        if @package.save
          render json: @package, status: :created
        else
          render json: @package.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      if @current_user.present? && @package.user_id == @current_user.id
        if @package.update(package_params)
          render json: @package, status: :ok
        else
          render json: @package.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      if @current_user.present? && @package.user_id == @current_user.id
        @package.destroy
      else
        render body: nil, status: :forbidden
      end
    end

    private
      def set_package
        @package = Package.find(params[:id])
      end

      def package_params
        params.require(:package).permit(:template, :image_urls)
      end
  end
end
