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
require 'rails_helper'

RSpec.describe ProductMeasurement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
