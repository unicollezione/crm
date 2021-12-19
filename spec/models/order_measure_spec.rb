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
require 'rails_helper'

RSpec.describe OrderMeasure, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
