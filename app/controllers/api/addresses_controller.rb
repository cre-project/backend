module Api
  class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        render json: Address.where(user_id: @current_user.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      if @current_user.present? && @address.user_id == @current_user.id
        render json: @address
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @address = @current_user.addresses.build(address_params)

        if @address.save
          render json: @address, status: :created
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      if @current_user.present? && @address.user_id == @current_user.id
        if @address.update(address_params)
          render json: @address, status: :ok
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      if @current_user.present? && @address.user_id == @current_user.id
        @address.destroy
      else
        render body: nil, status: :forbidden
      end
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
