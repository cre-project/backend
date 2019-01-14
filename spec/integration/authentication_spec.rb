require "spec_helper"
require "rails_helper"

class AuthenticationTest < ActionDispatch::IntegrationTest

  RSpec.describe "authenticate user", :type => :request do

    it "returns token if credentials match" do
      user = build_stubbed(:user)
      post =  post "/api/authenticate", params: { email: user.email, password: user.password }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      # expect(response).to have_http_status(:success)
      # assert_equal 200, status
    end

    it "returns error if credentials don't match" do
      user = build_stubbed(:user)
      post =  post "/api/authenticate", params: { email: "Marion", password: user.password }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to have_http_status(:unauthorized)
      assert_equal 401, status
    end

  end

end
