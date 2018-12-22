require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get api_properties_url, as: :json
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post api_properties_url, params: { property: { name: @property.name, year_built: @property.year_built, number_of_stories: @property.number_of_stories, lot_size: @property.lot_size, apn: @property.apn, price: @property.price, total_square_feet: @property.total_square_feet, user_id: @property.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show property" do
    get api_property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch api_property_url(@property), params: { property: { name: @property.name, year_built: @property.year_built, number_of_stories: @property.number_of_stories, lot_size: @property.lot_size, apn: @property.apn, price: @property.price, total_square_feet: @property.total_square_feet, user_id: @property.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete api_property_url(@property), as: :json
    end

    assert_response 204
  end
end
