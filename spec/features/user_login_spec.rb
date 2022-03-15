require 'rails_helper'

RSpec.feature "User Logins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(firtname: "alice", lastname: "Doe", 
      email: "alice@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    click_on "Login"
    
    expect(page).to have_no_content('Logout')

    fill_in 'email', with: 'alice@abc.com'
    fill_in 'password', with: 'ABCDEFGH'
    find_button('Login').click
    # all('button', :text => 'Login')[1].click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content('Logout'), count: 1
  end
end
