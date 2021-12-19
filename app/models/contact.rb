# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  customer_id     :bigint           not null
#  contact_type_id :bigint           not null
#  value           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Contact < ApplicationRecord
  belongs_to :customer
  belongs_to :contact_type
end
