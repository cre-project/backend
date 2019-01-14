FactoryBot.define do
  factory :user do
      first_name { "Mickey" }
      last_name  { "Mouse" }
      email { "mickey.mouse@gmail.com" }
      password { "123" }
      reset_password_token { }
      reset_password_sent_at { Time.now }
  end
end
