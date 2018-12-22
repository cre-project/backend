require 'test_helper'


class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get api_addresses_url, as: :json
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post api_addresses_url, params: { address: { city: @address.city, state: @address.state, street: @address.street, zip: @address.zip } }, as: :json
    end

    assert_response 201
  end

  test "should show address" do
    get api_address_url(@address), as: :json
    assert_response :success
  end

  test "should update address" do
    patch api_address_url(@address), params: { address: { city: @address.city, state: @address.state, street: @address.street, zip: @address.zip } }, as: :json
    assert_response 200
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete api_address_url(@address), as: :json
    end

    assert_response 204
  end
end

