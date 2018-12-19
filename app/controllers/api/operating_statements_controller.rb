module Api
  class OperatingStatementsController < ApplicationController
    before_action :set_operating_statement, only: [:show, :update, :destroy]

    # GET /operating_statements
    # GET /operating_statements.json
    def index
      @operating_statements = OperatingStatement.all
    end

    # GET /operating_statements/1
    # GET /operating_statements/1.json
    def show
    end

    # POST /operating_statements
    # POST /operating_statements.json
    def create
      @operating_statement = OperatingStatement.new(operating_statement_params)

      if @operating_statement.save
        render :show, status: :created, location: @operating_statement
      else
        render json: @operating_statement.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /operating_statements/1
    # PATCH/PUT /operating_statements/1.json
    def update
      if @operating_statement.update(operating_statement_params)
        render :show, status: :ok, location: @operating_statement
      else
        render json: @operating_statement.errors, status: :unprocessable_entity
      end
    end

    # DELETE /operating_statements/1
    # DELETE /operating_statements/1.json
    def destroy
      @operating_statement.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_operating_statement
        @operating_statement = OperatingStatement.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def operating_statement_params
        params.fetch(:operating_statement, {})
      end
  end
end
