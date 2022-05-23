FactoryBot.define do
  factory :product do
    idx {Faker::IDNumber.valid}
    name{Faker::Name.name}
  end
end
