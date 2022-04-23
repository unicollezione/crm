class TrelloList < ApplicationRecord
  belongs_to :order
  belongs_to :workroom

  def public_id
    self[:public_id]
  end
end
