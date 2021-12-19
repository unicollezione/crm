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
class ProductFabricContent < ApplicationRecord
  belongs_to :product
  belongs_to :fabric_content
end
