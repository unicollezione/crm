# frozen_string_literal: true

# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  country_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord
  belongs_to :country
end
