FactoryBot.define do
  factory :order do
    idx {Faker::IDNumber.valid}
    purchased_at{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    association :customer
    association :product
    association :fabric
    association :workroom
    comment{Faker::Lorem.sentence(word_count: 3)}
    aasm_state{ :купить }
    trello_url { nil }
    notes { '' }
  end
end
