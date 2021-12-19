# == Schema Information
#
# Table name: product_fabric_contents
#
#  id                :bigint           not null, primary key
#  product_id        :bigint           not null
#  fabric_content_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :product_fabric_content do
    product { nil }
    fabric_content { nil }
  end
end
