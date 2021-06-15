FactoryBot.define do
  factory :customer_measure do
    measure_id{Measure.ids.sample}
    customer_id{Customer.ids.sample}
    value{[true,false].sample}
  end
end
