require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { description: @user.description, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, license_number: @user.license_number, phone_number: @user.phone_number, subscription_expiration: @user.subscription_expiration, title: @user.title } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { description: @user.description, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, license_number: @user.license_number, phone_number: @user.phone_number, subscription_expiration: @user.subscription_expiration, title: @user.title } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    delete user_url(@user), as: :json

    assert_response 501
  end
end
