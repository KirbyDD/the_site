require 'rails_helper'

RSpec.describe Reminder, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
  end

  describe 'attributes' do
    it 'should have default attributes' do
      
      reminder = Reminder.create(title: "Test title", message: "Test Message", link: "http://www.example.com/")
      
      expect(reminder[:title]).to eq("Test title")
      expect(reminder[:message]).to eq("Test Message")
      expect(reminder[:link]).to eq("http://www.example.com/")
      expect(reminder[:episode]).to eq(1)
      expect(reminder[:chapter]).to eq(1)
    end
  end
end