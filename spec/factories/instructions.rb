# == Schema Information
#
# Table name: instructions
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :instruction do
    product { nil }
    title { "MyString" }
    body { "" }
  end
end
