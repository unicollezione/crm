# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  country_id  :bigint           not null
#  city_id     :bigint           not null
#  street      :string
#  tag         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country
  belongs_to :city
end
