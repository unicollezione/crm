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
class Customer < ApplicationRecord
  validates :nickname, presence: true
  has_many :orders
  has_many :products
  has_many :contacts, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def name
    nickname
  end
end
