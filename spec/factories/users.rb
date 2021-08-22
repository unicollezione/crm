FactoryBot.define do
  factory :user do
    email { "MyString" }
    password_digest { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    remember_token { "MyString" }
    remember_token_expires_at { "2021-08-22 13:59:27" }
  end
end
