FactoryBot.define do
  factory :order do
    idx {Faker::IDNumber.valid}
    customer_id{Customer.ids.sample}
    purchased_at{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    product_id{Product.ids.sample}
    fabric_id{Fabric.ids.sample}
    comment{Faker::Lorem.sentence(word_count: 3)}
    aasm_state{[true,false].sample}
  end
end
