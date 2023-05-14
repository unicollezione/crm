# frozen_string_literal: true

# Orders helpers
module OrdersHelper
  def next_order_idx
    Order.last&.idx&.next || 1
  end
end
