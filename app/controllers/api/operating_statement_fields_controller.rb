module Api
  class OperatingStatementFieldsController < ApplicationController
    before_action :set_operating_statement_field, only: [:show, :update, :destroy]

    def index
      render json: OperatingStatementField.all.order('created_at DESC')
    end

    def show
      render json: @operating_statement_field
    end

    def create
      @operating_statement_field = OperatingStatementField.new(operating_statement_field_params)

      if @operating_statement_field.save
        render json: @operating_statement_field, status: :created
      else
        render json: @operating_statement_field.errors, status: :unprocessable_entity
      end
    end

    def update
      if @operating_statement_field.update(operating_statement_field_params)
        render json: @operating_statement_field, status: :ok
      else
        render json: @operating_statement_field.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @operating_statement_field.destroy
    end

    private
      def set_operating_statement_field
        @operating_statement_field = OperatingStatementField.find(params[:id])
      end

      def operating_statement_field_params
        params.require(:operating_statement_field).permit(:name, :current_value, :potential_value, :is_income, :operating_statement_id)
      end
  end
end
