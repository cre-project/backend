class OperatingStatementFieldsController < ApplicationController
  before_action :set_operating_statement_field, only: [:show, :update, :destroy]

  # GET /operating_statement_fields
  # GET /operating_statement_fields.json
  def index
    @operating_statement_fields = OperatingStatementField.all
  end

  # GET /operating_statement_fields/1
  # GET /operating_statement_fields/1.json
  def show
  end

  # POST /operating_statement_fields
  # POST /operating_statement_fields.json
  def create
    @operating_statement_field = OperatingStatementField.new(operating_statement_field_params)

    if @operating_statement_field.save
      render :show, status: :created, location: @operating_statement_field
    else
      render json: @operating_statement_field.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operating_statement_fields/1
  # PATCH/PUT /operating_statement_fields/1.json
  def update
    if @operating_statement_field.update(operating_statement_field_params)
      render :show, status: :ok, location: @operating_statement_field
    else
      render json: @operating_statement_field.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operating_statement_fields/1
  # DELETE /operating_statement_fields/1.json
  def destroy
    @operating_statement_field.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_statement_field
      @operating_statement_field = OperatingStatementField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operating_statement_field_params
      params.require(:operating_statement_field).permit(:name, :current_value, :potential_value, :is_income, :operating_statement_id)
    end
end
