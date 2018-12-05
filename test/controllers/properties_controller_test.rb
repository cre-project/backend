require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url, as: :json
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { apn: @property.apn, lot_size: @property.lot_size, name: @property.name, number_of_stories: @property.number_of_stories, price: @property.price, total_square_feet: @property.total_square_feet, year_built: @property.year_built } }, as: :json
    end

    assert_response 201
  end

  test "should show property" do
    get property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { apn: @property.apn, lot_size: @property.lot_size, name: @property.name, number_of_stories: @property.number_of_stories, price: @property.price, total_square_feet: @property.total_square_feet, year_built: @property.year_built } }, as: :json
    assert_response 200
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property), as: :json
    end

    assert_response 204
  end
end
