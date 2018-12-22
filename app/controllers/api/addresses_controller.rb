# To be deleted, as address will be edited through other objects (e.g. property)

module Api
  class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]

    def index
      render json: Address.all.order('created_at DESC')
    end

    def show
      render json: @address
    end

    def create
      @address = Address.new(address_params)

      if @address.save
        render json: @address, status: :created
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end

    def update
      if @address.update(address_params)
        render json: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @address.destroy
    end

    private
      def set_address
        @address = Address.find(params[:id])
      end

      def address_params
        params.require(:address).permit(:street, :city, :state, :zip)
      end
  end
end
