# == Schema Information
#
# Table name: product_measurements
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  measure_id :bigint           not null
#  range      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :product_measurement do
    product { nil }
    measure { nil }
    range { "MyString" }
  end
end
