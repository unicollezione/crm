FactoryBot.define do
  factory :customers do
    nickname {Faker::Name.first_name}
    idx {Faker::IDNumber.valid}

    factory :customer_with_products do
      transient do
        products_count {5}
      end
      after(:create) do |customer,e|
        create_list(:product, e.products_count, customer: customer)
      end
    end

    #factory :customer_with_orders do
     # transient do
      #  orders_count {5}
      #end
      #after(:create) do |customer,e|
      #  create_list(:order, e.orders_count, customer: customer)
      #end
    #end
  end
end
