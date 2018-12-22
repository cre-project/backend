require 'test_helper'


class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get api_companies_url, as: :json
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post api_companies_url, params: { company: { logo_url: @company.logo_url, name: @company.name, website_url: @company.website_url } }, as: :json
    end

    assert_response 201
  end

  test "should show company" do
    get api_company_url(@company), as: :json
    assert_response :success
  end

  test "should update company" do
    patch api_company_url(@company), params: { company: { logo_url: @company.logo_url, name: @company.name, website_url: @company.website_url } }, as: :json
    assert_response 200
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete api_company_url(@company), as: :json
    end

    assert_response 204
  end
end
