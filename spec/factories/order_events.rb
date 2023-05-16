FactoryBot.define do
  factory :order_event do
    order { nil }
    event_source { "MyString" }
    body { "" }
  end
end
