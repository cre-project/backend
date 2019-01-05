require "spec_helper"
require "rails_helper"

class CreateUserTest < ActionDispatch::IntegrationTest

  RSpec.describe "user subscription", :type => :request do
    request_body = JSON.parse('{
      "event_type": "subscription_activate",
      "event_source": "checkout",
      "data": {
        "plan": {
          "plan_active": "true",
          "bump_offer": {},
          "createdAt": "2018-10-01T11:42:29.036Z",
          "updatedAt": "2018-10-01T11:42:29.036Z",
          "id": "5bb2082501605a3642b6f767",
          "product_id": "5bb2081801605a3642b6f766",
          "user_id": "5b961bc55dfff7797d9cd897",
          "plan_name": "one time",
          "plan_code": "one-time",
          "price": 100,
          "billing_period": "",
          "billing_period_num": "",
          "billing_cycle": "onetime",
          "billing_cycle_num": null,
          "trial_period": 0,
          "setup_fee": 0,
          "plan_description": ""
        },
        "setup_fee": null,
        "payment_terms": "",
        "currency_symbol": "$",
        "payment_method": "5bbee98b458d576755a217d5",
        "cron_process": "done",
        "createdAt": "2018-10-11T06:11:22.711Z",
        "updatedAt": "2018-10-11T06:11:22.711Z",
        "id": "5bbee98a458d576755a217d2",
        "customer_id": "5bbee98a458d576755a217d1",
        "product_id": "5bb2081801605a3642b6f766",
        "plan_id": "5bb2082501605a3642b6f767",
        "amount": 100,
        "email_id": "testwebhook2@gmail.com",
        "status": "live",
        "quantity": 1,
        "starts_at": "2018-10-11T06:11:22.222Z",
        "activation_date": "2018-10-11T06:11:24.242Z",
        "expires_at": null,
        "expiry_date": "2118-10-11T06:11:22.222Z",
        "trial_days": 0,
        "trial_expiry_date": "",
        "next_billing_date": "",
        "last_billing_date": "2018-10-11T06:11:24.242Z"
      },
      "create_time": "2018-10-11T06:11:25.184Z"
    }').to_json

    it "creates user" do
      post "/api/users", params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_equal 201, status
    end
  end
end
