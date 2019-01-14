require "spec_helper"
require "rails_helper"

class PasswordResetTest < ActionDispatch::IntegrationTest

  RSpec.describe "password reset", :type => :request do

    request_body = { "email": "donald.duck@gmail.com" }.to_json
    it "returns ok when user not found" do
      user = build_stubbed(:user)
      post "/api/passwords/request_reset", params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_response 200, status
    end

    it "returns ok when user is present and add password reset token" do
      user = build_stubbed(:user)
      post =  post "/api/passwords/request_reset", params: { email: user.email }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to have_http_status(:success)
      assert_equal 200, status
    end

    it "returns ok when user is found" do
      user = build_stubbed(:user)
      post = post "/api/passwords/request_reset", params: { email: user.email }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to have_http_status(:success)
      assert_equal 200, status
    end

    it "returns ok on password reset and delete token" do
      user = build_stubbed(:user)
      post = post "/api/passwords/reset", params: { token: user.reset_password_token }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to have_http_status(:success)
      assert_equal 200, status
    end
  end
end

