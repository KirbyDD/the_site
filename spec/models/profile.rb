require 'rails_helper'

RSpec.describe Profile do
  describe 'validations' do
    it {should validate_uniqueness_of :user_id}
  end

  describe 'relationships' do
    it {should belong_to :user}
  end
end
