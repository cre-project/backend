require 'test_helper'

class SoldPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sold_property = sold_properties(:one)
  end

  test "should get index" do
    get sold_properties_url, as: :json
    assert_response :success
  end

  test "should create sold_property" do
    assert_difference('SoldProperty.count') do
      post sold_properties_url, params: { sold_property: { bathrooms: @sold_property.bathrooms, bedrooms: @sold_property.bedrooms, cap_rate: @sold_property.cap_rate, close_of_escrow: @sold_property.close_of_escrow, grm: @sold_property.grm, image_url: @sold_property.image_url, name: @sold_property.name, num_units: @sold_property.num_units, price_per_sf: @sold_property.price_per_sf, price_per_unit: @sold_property.price_per_unit, rent: @sold_property.rent, sales_price: @sold_property.sales_price, year_built: @sold_property.year_built, package_id: @sold_property.package_id } }, as: :json
    end

    assert_response 201
  end

  test "should show sold_property" do
    get sold_property_url(@sold_property), as: :json
    assert_response :success
  end

  test "should update sold_property" do
    patch sold_property_url(@sold_property), params: { sold_property: { bathrooms: @sold_property.bathrooms, bedrooms: @sold_property.bedrooms, cap_rate: @sold_property.cap_rate, close_of_escrow: @sold_property.close_of_escrow, grm: @sold_property.grm, image_url: @sold_property.image_url, name: @sold_property.name, num_units: @sold_property.num_units, price_per_sf: @sold_property.price_per_sf, price_per_unit: @sold_property.price_per_unit, rent: @sold_property.rent, sales_price: @sold_property.sales_price, year_built: @sold_property.year_built } }, as: :json
    assert_response 200
  end

  test "should destroy sold_property" do
    assert_difference('SoldProperty.count', -1) do
      delete sold_property_url(@sold_property), as: :json
    end

    assert_response 204
  end
end
