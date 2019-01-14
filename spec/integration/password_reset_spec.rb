require "spec_helper"
require "rails_helper"

class PasswordResetTest < ActionDispatch::IntegrationTest

  RSpec.describe "password reset", :type => :request do
    let!(:user) { create(:user) }

    request_body = { "email": "donald.duck@gmail.com" }.to_json
    it "returns error when user not found" do
      post "/api/passwords/request_reset", params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_equal 404, status
    end

    it "send password reset email to user" do
      # expect { post "/api/passwords/request_reset", params: { email: user.email }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }}.to change { user.reset_password_token }
      # assert_equal 200, status
    end
  end
end

