# == Schema Information
#
# Table name: order_measures
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  measure_id :bigint           not null
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :order_measure do
    order { nil }
    measure { nil }
    value { 1 }
  end
end
