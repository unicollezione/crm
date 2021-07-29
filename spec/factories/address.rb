FactoryBot.define do
  factory :address do    
    street{Faker::Address.street_name}
    tag{Faker::Lorem.word}
    customer
    country 
    city 
  end
end
