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
require 'rails_helper'

RSpec.describe Instruction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
