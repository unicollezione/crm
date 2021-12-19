# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  idx        :integer
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :customers do
    sequence(:nickname) { |n| "factorycustomer#{n}" }
  end
end
