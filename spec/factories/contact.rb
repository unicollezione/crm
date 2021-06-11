FactoryBot.define do
  factory :contact do
    customer_id{Customer.ids.sample}
    contact_type_id{ContactType.ids.sample}
    value{[true,false].sample}
  end
end
