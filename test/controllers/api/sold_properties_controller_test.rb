require 'test_helper'

class SoldPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sold_property = sold_properties(:one)
  end

  test "should get index" do
    get api_sold_properties_url, as: :json
    assert_response :success
  end

  test "should create sold_property" do
    assert_difference('SoldProperty.count') do
      post api_sold_properties_url, params: { sold_property: {  year_built: @sold_property.year_built, sales_price: @sold_property.sales_price, num_units: @sold_property.num_units, cap_rate: @sold_property.cap_rate, grm: @sold_property.grm, close_of_escrow: @sold_property.close_of_escrow, image_url: @sold_property.image_url, square_feet: @sold_property.square_feet, user_id: @sold_property.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show sold_property" do
    get api_sold_property_url(@sold_property), as: :json
    assert_response :success
  end

  test "should update sold_property" do
    patch api_sold_property_url(@sold_property), params: { sold_property: {  year_built: @sold_property.year_built, sales_price: @sold_property.sales_price, num_units: @sold_property.num_units, cap_rate: @sold_property.cap_rate, grm: @sold_property.grm, close_of_escrow: @sold_property.close_of_escrow, image_url: @sold_property.image_url, user_id: @sold_property.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy sold_property" do
    assert_difference('SoldProperty.count', -1) do
      delete api_sold_property_url(@sold_property), as: :json
    end

    assert_response 204
  end
end
