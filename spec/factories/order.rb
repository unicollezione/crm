FactoryBot.define do
  factory :order do
    idx {Faker::IDNumber.valid}
    customer_id {Customer.ids.sample}
    purchased_at{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    product_id {Product.ids.sample}
    fabric_id {Fabric.ids.sample}
    workroom_id {Workroom.ids.sample}
    comment{Faker::Lorem.sentence(word_count: 3)}
    aasm_state{ :купить }
    association :customer
    trello_url { nil }
  end
end
