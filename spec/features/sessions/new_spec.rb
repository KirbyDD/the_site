require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'can log in with username and password' do
    user = User.create(username: "tron", email: "test@example.com", password: "test", password_confirmation: "test")
    visit '/login'

    fill_in :email, with: "test@example.com"
    fill_in :password, with: "test"
    click_on "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome tron")
  end
end
