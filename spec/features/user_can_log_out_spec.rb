require 'rails_helper'

RSpec.feature "User can login and logout" do
  context "providing valid credentials" do
    scenario "login is successful" do
      user = User.create(first_name: "Edilene", last_name: "Storm", username: "perfectstorm", email: "perfectstorm@email.com", password: "password", password_confirmation: "password")

      visit login_path
      expect(page).to have_content("Welcome to Gif Generator")

      fill_in "session[username]", with: "perfectstorm"
      fill_in "session[password]", with: "password"
      click_on "Login"

      expect(current_path).to eq(user_path(user))

      within("h1") do
        expect(page).to have_content("Welcome, Edilene!")
      end
    end
  end

  scenario "logout is successful" do
    user = User.create(first_name: "Edilene", last_name: "Storm", username: "perfectstorm", email: "perfectstorm@email.com", password: "password", password_confirmation: "password")

    visit login_path
    expect(page).to have_content("Welcome to Gif Generator")

    fill_in "session[username]", with: "perfectstorm"
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(current_path).to eq(user_path(user))

    within("h1") do
      expect(page).to have_content("Welcome, Edilene!")
    end

    click_on "Logout"
    expect(page).to have_content("Have an account, please login:")
  end
end
