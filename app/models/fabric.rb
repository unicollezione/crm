# frozen_string_literal: true

# == Schema Information
#
# Table name: fabrics
#
#  id          :bigint           not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material    :string
#  description :text
#
class Fabric < ApplicationRecord
  has_one_attached :illustration
end
