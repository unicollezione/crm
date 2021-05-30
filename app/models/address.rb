class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country
  belongs_to :city
end
