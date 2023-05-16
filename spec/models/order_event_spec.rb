require 'rails_helper'

RSpec.describe OrderEvent, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
  end

  describe 'validations' do
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:event_source) }
    it { should validate_presence_of(:body) }
  end
end
