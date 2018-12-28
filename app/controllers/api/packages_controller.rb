module Api
  class PackagesController < ApplicationController
    before_action :set_package, only: [:show, :update, :destroy]

    def index
      render json: Package.all
    end

    def show
      render json: @package
    end

    def create
      @package = Package.new(package_params)

      if @package.save
        render json: @package, status: :created
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end

    def update
      if @package.update(package_params)
        render json: @package, status: :ok
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @package.destroy
    end

    private
      def set_package
        @package = Package.find(params[:id])
      end

      def package_params
        params.require(:package).permit(:template, :property_id, :user_id)
      end
  end
end
