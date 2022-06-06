# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  email                     :string
#  password_digest           :string
#  first_name                :string
#  last_name                 :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password_digest { "12345678" }
    first_name { "FirstName" }
    last_name { "LastName" }
    remember_token { "Token" }
    remember_token_expires_at { "2021-08-22 13:59:27" }
  end
end
