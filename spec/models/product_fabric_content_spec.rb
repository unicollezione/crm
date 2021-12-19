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
require 'rails_helper'

RSpec.describe ProductFabricContent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
