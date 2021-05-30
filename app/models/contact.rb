class Contact < ApplicationRecord
  belongs_to :customer
  belongs_to :contact_type
end
