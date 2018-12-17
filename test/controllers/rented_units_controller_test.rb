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
      post rented_units_url, params: { rented_unit: { year_built: @rented_unit.year_built, bedrooms: @rented_unit.bedrooms, bathrooms: @rented_unit.bathrooms, image_url: @rented_unit.image_url, current_rent: @rented_unit.current_rent, user_id: @rented_unit.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show rented_unit" do
    get rented_unit_url(@rented_unit), as: :json
    assert_response :success
  end

  test "should update rented_unit" do
    patch rented_unit_url(@rented_unit), params: { rented_unit: { year_built: @rented_unit.year_built, bedrooms: @rented_unit.bedrooms, bathrooms: @rented_unit.bathrooms, image_url: @rented_unit.image_url, current_rent: @rented_unit.current_rent, user_id: @rented_unit.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy rented_unit" do
    assert_difference('RentedUnit.count', -1) do
      delete rented_unit_url(@rented_unit), as: :json
    end

    assert_response 204
  end
end
