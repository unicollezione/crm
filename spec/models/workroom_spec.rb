# frozen_string_literal: true

# == Schema Information
#
# Table name: workrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  chat       :string
#  status     :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Workroom, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
