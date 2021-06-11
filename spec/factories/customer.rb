FactoryBot.define do
  factory :customer do
    nickname {Faker::Name.name}
    idx {Faker::IDNumber.valid}
  end
end
