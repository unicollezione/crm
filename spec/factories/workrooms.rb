# frozen_string_literal: true

# == Schema Information
#
# Table name: workrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  chat       :string
#  status     :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :workroom do
    name { 'MyWorkroom' }
    chat { 'MyChat' }
    status { 'MyStatus' }
    link { 'MyLink' }
  end
end
