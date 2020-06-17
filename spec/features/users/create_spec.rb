require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can create a user profile' do
    
    visit '/users/new'

    fill_in :username, with: "Tron Kat"
    fill_in :email, with: "user@example.com"
    fill_in :password, with: "test"
    fill_in :password_confirmation, with: "test"

    click_on "Create Account"

    expect(current_path).to eq('/dashboard')

    user = User.last

    expect(user[:username]).to eq("Tron Kat")
    expect(user[:email]).to eq("user@example.com")

    expect(page).to have_content("Welcome #{user[:username]}")
  end
end
