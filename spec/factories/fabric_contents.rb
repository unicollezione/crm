# == Schema Information
#
# Table name: fabric_contents
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :fabric_content do
    name { "MyString" }
  end
end
