# frozen_string_literal: true

class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :idx, :nickname
  set_key_transform :camel_lower
end
