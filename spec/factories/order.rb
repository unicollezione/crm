FactoryBot.define do
  factory :order do
    customer
    purchased_at{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    product
    fabric
    workroom
    comment{Faker::Lorem.sentence(word_count: 3)}
    #aasm_state{[true,false].sample}
  end
end
