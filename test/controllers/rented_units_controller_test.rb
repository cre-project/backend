require 'test_helper'

class RentedUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rented_unit = rented_units(:one)
  end

  test "should get index" do
    get rented_units_url, as: :json
    assert_response :success
  end

  test "should create rented_unit" do
    assert_difference('RentedUnit.count') do
      post rented_units_url, params: { rented_unit: { bathrooms: @rented_unit.bathrooms, bedrooms: @rented_unit.bedrooms, cap_rate: @rented_unit.cap_rate, close_of_escrow: @rented_unit.close_of_escrow, grm: @rented_unit.grm, image_url: @rented_unit.image_url, name: @rented_unit.name, num_units: @rented_unit.num_units, price_per_sf: @rented_unit.price_per_sf, price_per_unit: @rented_unit.price_per_unit, rent: @rented_unit.rent, sales_price: @rented_unit.sales_price, year_built: @rented_unit.year_built, package_id: @rented_unit.package_id } }, as: :json
    end

    assert_response 201
  end

  test "should show rented_unit" do
    get rented_unit_url(@rented_unit), as: :json
    assert_response :success
  end

  test "should update rented_unit" do
    patch rented_unit_url(@rented_unit), params: { rented_unit: { bathrooms: @rented_unit.bathrooms, bedrooms: @rented_unit.bedrooms, cap_rate: @rented_unit.cap_rate, close_of_escrow: @rented_unit.close_of_escrow, grm: @rented_unit.grm, image_url: @rented_unit.image_url, name: @rented_unit.name, num_units: @rented_unit.num_units, price_per_sf: @rented_unit.price_per_sf, price_per_unit: @rented_unit.price_per_unit, rent: @rented_unit.rent, sales_price: @rented_unit.sales_price, year_built: @rented_unit.year_built } }, as: :json
    assert_response 200
  end

  test "should destroy rented_unit" do
    assert_difference('RentedUnit.count', -1) do
      delete rented_unit_url(@rented_unit), as: :json
    end

    assert_response 204
  end
end
