require 'test_helper'

class OperatingStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operating_statement = operating_statements(:one)
  end

  test "should get index" do
    get operating_statements_url, as: :json
    assert_response :success
  end

  test "should create operating_statement" do
    assert_difference('OperatingStatement.count') do
      post operating_statements_url, params: { operating_statement: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show operating_statement" do
    get operating_statement_url(@operating_statement), as: :json
    assert_response :success
  end

  test "should update operating_statement" do
    patch operating_statement_url(@operating_statement), params: { operating_statement: {  } }, as: :json
    assert_response 200
  end

  test "should destroy operating_statement" do
    assert_difference('OperatingStatement.count', -1) do
      delete operating_statement_url(@operating_statement), as: :json
    end

    assert_response 204
  end
end
