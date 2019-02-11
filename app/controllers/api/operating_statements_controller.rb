module Api
  class OperatingStatementsController < ApplicationController
    before_action :set_operating_statement, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        render json: OperatingStatement.where(package_id: @package.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      @package = @current_user.packages.find_by(id: params[:package_id])
      if @current_user.present? && @package.user_id == @current_user.id
        render json: @operating_statement
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        @operating_statement = @package.operating_statements.build(operating_statement_create_params)

        if @package.save && @operating_statement.save
          render json: @operating_statement, status: :created
        else
          render json: @operating_statement.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def update
      @package = @current_user.packages.find_by(id: params[:package_id])

      if @current_user.present? && @package.user_id == @current_user.id
        if @operating_statement.update(operating_statement_params)
          render json: @operating_statement, status: :ok
        else
          render json: @operating_statement.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @package = @current_user.packages.find_by(id: params[:package_id])

      if @current_user.present? && @package.user_id == @current_user.id
        @operating_statement.destroy
      else
        render body: nil, status: :forbidden
      end
    end

    private
      def set_operating_statement
        @operating_statement = OperatingStatement.find(params[:id])
      end
      def operating_statement_create_params
        params.permit(:operating_statement).permit(:package_id)
      end
      def operating_statement_params
        params.require(:operating_statement).permit(:vacancy, :taxes, :taxes_label, :mgmt_fee, :mgmt_fee_label)
      end
  end
end
