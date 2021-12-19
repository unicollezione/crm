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
class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :idx, :nickname
  set_key_transform :camel_lower
end
