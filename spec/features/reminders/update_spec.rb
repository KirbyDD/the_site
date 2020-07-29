require 'rails_helper'

RSpec.describe 'As a logged in user' do
  it 'should allow reminder to be updated' do
    user = create(:user)
    reminder = user.reminders.create!(title: "Test Title", chapter: 10, message: "Test Message")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/reminders/#{reminder.id}"
    click_on "Update"

    expect(current_path).to eq("/reminders/#{reminder.id}/edit")
    fill_in :episode, with: 15
    click_on "Update Reminder"

    expect(current_path).to eq("/reminders/#{reminder.id}")
    reminder.reload

    expect(reminder.episode).to eq(15)
    expect(page).to have_content("Episode: 15")
  end
end
