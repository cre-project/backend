require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get api_packages_url, as: :json
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post api_packages_url, params: { package: { property_id: @package.property_id, rented_unit_id: @package.rented_unit_id, sold_property_id: @package.sold_property_id, template: @package.template, user_id: @package.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show package" do
    get api_package_url(@package), as: :json
    assert_response :success
  end

  test "should update package" do
    patch api_package_url(@package), params: { package: { property_id: @package.property_id, rented_unit_id: @package.rented_unit_id, sold_property_id: @package.sold_property_id, template: @package.template } }, as: :json
    assert_response 200
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete api_package_url(@package), as: :json
    end

    assert_response 204
  end
end
