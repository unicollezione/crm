FactoryBot.define do
  factory :product_measurement do
    product { nil }
    measure { nil }
    range { "MyString" }
  end
end
