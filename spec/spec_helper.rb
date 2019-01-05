require 'webmock/rspec'
require 'json'


RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://payments.pabbly.com/api/v1/customer/5bbee98a458d576755a217d1").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Basic Yjg0ZDljYzI4ZWYzZWRlMWYyMGE6', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: {
        "status": "success",
        "message": "Customer data",
        "data": {
            "company_name": "test",
            "shipping_address": {},
            "createdAt": "2018-12-27T15:13:42.523Z",
            "updatedAt": "2018-12-27T15:13:42.523Z",
            "id": "5c24ec2665a9990bb78fc333",
            "first_name": "a",
            "last_name": "v",
            "email_id": "monika.kedrova@gmail.com",
            "billing_address": {},
            "client_portal": false
        }
      }.to_json, headers: {})
    end
  end
end
