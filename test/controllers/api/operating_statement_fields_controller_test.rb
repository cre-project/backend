require 'test_helper'

class OperatingStatementFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operating_statement_field = operating_statement_fields(:one)
  end

  test "should get index" do
    get api_operating_statement_fields_url, as: :json
    assert_response :success
  end

  test "should create operating_statement_field" do
    assert_difference('OperatingStatementField.count') do
      post api_operating_statement_fields_url, params: { operating_statement_field: { current_value: @operating_statement_field.current_value, is_income: @operating_statement_field.is_income, name: @operating_statement_field.name, operating_statement_id: @operating_statement_field.operating_statement_id, potential_value: @operating_statement_field.potential_value, operating_statement_id: @operating_statement_field.operating_statement_id } }, as: :json
    end

    assert_response 201
  end

  test "should show operating_statement_field" do
    get api_operating_statement_field_url(@operating_statement_field), as: :json
    assert_response :success
  end

  test "should update operating_statement_field" do
    patch api_operating_statement_field_url(@operating_statement_field), params: { operating_statement_field: { current_value: @operating_statement_field.current_value, is_income: @operating_statement_field.is_income, name: @operating_statement_field.name, operating_statement_id: @operating_statement_field.operating_statement_id, potential_value: @operating_statement_field.potential_value } }, as: :json
    assert_response 200
  end

  test "should destroy operating_statement_field" do
    assert_difference('OperatingStatementField.count', -1) do
      delete api_operating_statement_field_url(@operating_statement_field), as: :json
    end

    assert_response 204
  end
end
