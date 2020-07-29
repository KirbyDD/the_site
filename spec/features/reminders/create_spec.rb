require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I can create a reminder' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/reminders/new"

    fill_in :title, with: "Test Title"
    fill_in :message, with: "Test Message"
    fill_in :link, with: "http://www.example.com/"
    fill_in :episode, with: 20
    fill_in :chapter, with: 3

    click_on "Create Reminder"

    expect(current_path).to eq('/dashboard')
    reminder = Reminder.last

    visit '/reminders'
    expect(reminder[:title]).to eq("Test Title")
    click_on "Test Title"
    expect(current_path).to eq("/reminders/#{reminder.id}")

    expect(reminder[:title]).to eq("Test Title")
    expect(reminder[:message]).to eq("Test Message")
    expect(reminder[:link]).to eq("http://www.example.com/")
    expect(reminder[:episode]).to eq(20)
    expect(reminder[:chapter]).to eq(3)

    expect(page).to have_content(reminder[:title])
  end
end
