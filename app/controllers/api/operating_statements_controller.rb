module Api
  class OperatingStatementsController < ApplicationController
    before_action :set_operating_statement, only: [:show, :update, :destroy]

    def index
      render json: OperatingStatement.all.order('created_at DESC')
    end

    def show
      render json: @operating_statement
    end

    def create
      @operating_statement = OperatingStatement.new(operating_statement_params)

      if @operating_statement.save
        render json: @operating_statement, status: :created
      else
        render json: @operating_statement.errors, status: :unprocessable_entity
      end
    end

    def update
      if @operating_statement.update(operating_statement_params)
        render json: @operating_statement, status: :ok
      else
        render json: @operating_statement.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @operating_statement.destroy
    end

    private
      def set_operating_statement
        @operating_statement = OperatingStatement.find(params[:id])
      end

      def operating_statement_params
        params.fetch(:operating_statement, {})
      end
  end
end
