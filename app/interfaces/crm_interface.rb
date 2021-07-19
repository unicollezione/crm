# frozen_string_literal: true

require 'faraday'

class CrmInterface
  class << self
    def get_order
      new(transport: faraday, request: NotionQuery.get_order).call
    end
  end
end
