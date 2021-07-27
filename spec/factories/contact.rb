FactoryBot.define do
  factory :contact do
    customer
    contact_type
    value{Faker::Lorem.word}
  end
end
