require 'test_helper'

class PackageSoldPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_sold_property = package_sold_properties(:one)
  end

  test "should get index" do
    get package_sold_properties_url, as: :json
    assert_response :success
  end

  test "should create package_sold_property" do
    assert_difference('PackageSoldProperty.count') do
      post package_sold_properties_url, params: { package_sold_property: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show package_sold_property" do
    get package_sold_property_url(@package_sold_property), as: :json
    assert_response :success
  end

  test "should update package_sold_property" do
    patch package_sold_property_url(@package_sold_property), params: { package_sold_property: {  } }, as: :json
    assert_response 200
  end

  test "should destroy package_sold_property" do
    assert_difference('PackageSoldProperty.count', -1) do
      delete package_sold_property_url(@package_sold_property), as: :json
    end

    assert_response 204
  end
end
