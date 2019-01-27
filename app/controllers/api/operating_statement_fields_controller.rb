module Api
  class OperatingStatementFieldsController < ApplicationController
    before_action :set_operating_statement_field, only: [:show, :update, :destroy]

    def index
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        @operating_statement = @package.operating_statements.find_by(id: params[:operating_statement_id])
        render json: OperatingStatementField.where(operating_statement_id: @operating_statement.id)
      else
        render body: nil, status: :forbidden
      end
    end

    def show
      @package = @current_user.packages.find_by(id: params[:package_id])
      @operating_statement = @package.operating_statements.find_by(id: params[:operating_statement_id])
      if @current_user.present? && @package.user_id == @current_user.id
        render json: @operating_statement_field
      else
        render body: nil, status: :forbidden
      end
    end

    def create
      if @current_user.present?
        @package = @current_user.packages.find_by(id: params[:package_id])
        @operating_statement = @package.operating_statements.find_by(id: params[:operating_statement_id])
        @operating_statement_field = @operating_statement.operating_statement_fields.build(operating_statement_field_params)

        if @operating_statement_field.save
          render json: @operating_statement_field, status: :created
        else
          render json: @operating_statement_field.errors, status: :unprocessable_entity
        end
      end
    end

    def update
      @package = @current_user.packages.find_by(id: params[:package_id])
      @operating_statement = @package.operating_statements.find_by(id: params[:operating_statement_id])

      if @current_user.present? && @package.user_id == @current_user.id
        if @operating_statement_field.update(operating_statement_field_params)
          render json: @operating_statement_field, status: :ok
        else
          render json: @operating_statement_field.errors, status: :unprocessable_entity
        end
      else
        render body: nil, status: :forbidden
      end
    end

    def destroy
      @package = @current_user.packages.find_by(id: params[:package_id])
      @operating_statement = @package.operating_statements.find_by(id: params[:operating_statement_id])
      @operating_statement_field = @operating_statement.operating_statement_fields.find_by(id: params[:id])

      if @current_user.present? && @package.user_id == @current_user.id
        @operating_statement_field.destroy
        render json: @operating_statement_field, status: :ok
      else
        render body: nil, status: :forbidden
      end
    end

    private
    def set_operating_statement_field
      @operating_statement_field = OperatingStatementField.find(params[:id])
    end

    def operating_statement_field_params
      params.require(:operating_statement_field).permit(:name, :current_value, :potential_value, :is_income, :operating_statement_id)
    end

    def edit_params
      params.require(:operating_statement_field).permit(:name, :current_value, :potential_value)
    end
  end
end
