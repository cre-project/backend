require "rails_helper"
require "json"
require "spec_helper"

class CreateUserTest < ActionDispatch::IntegrationTest

  RSpec.describe "user subscription", :type => :request do
    request_body = {
      "event_type": "customer_create",
      "event_source": "checkout",
      "data": {
        "company_name": "Marion Inc.",
        "shipping_address": {},
        "createdAt": "2019-01-08T19:27:24.449Z",
        "updatedAt": "2019-01-08T19:27:24.449Z",
        "id": "5c34f99cfbfefc3720cc653b",
        "user_id": "5c164645ef788b4507f7ced8",
        "first_name": "Marion",
        "last_name": "Schleifer",
        "user_name": "marionwerwerw@gmail.com",
        "email_id": "marionwerwerw@gmail.com",
        "billing_address": {},
        "credit": nil,
        "pcustomer_id": "",
        "api": nil,
        "client_portal"=>false,
        permitted: false
      },
      "create_time": "2019-01-08T19:27:24.2424+00:00",
      "controller": "api/users",
      "action": "create",
      "user": {}
    }.to_json

    it "creates user" do
      post "/api/users", params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_equal 200, status
    end
  end
end
