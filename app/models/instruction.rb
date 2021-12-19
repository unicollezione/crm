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
class Instruction < ApplicationRecord
  belongs_to :product
end
