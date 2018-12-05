require 'test_helper'

class PropertyUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_unit = property_units(:one)
  end

  test "should get index" do
    get property_units_url, as: :json
    assert_response :success
  end

  test "should create property_unit" do
    assert_difference('PropertyUnit.count') do
      post property_units_url, params: { property_unit: { bathrooms: @property_unit.bathrooms, bedrooms: @property_unit.bedrooms, current_rent: @property_unit.current_rent, potential_rent: @property_unit.potential_rent } }, as: :json
    end

    assert_response 201
  end

  test "should destroy property_unit" do
    assert_difference('PropertyUnit.count', -1) do
      delete property_unit_url(@property_unit), as: :json
    end

    assert_response 204
  end
end
