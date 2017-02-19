require 'rails_helper'

RSpec.feature "Admin user can create categories" do
  context "valid admin user" do
    scenario "creates a category" do
      admin = User.create(first_name: "Edilene", last_name: "Boss", username: "bossy", email: "bossyboss@email.com", password: "password", password_confirmation: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit user_path(admin)
      click_on("Create a Category")

      expect(page).to have_content("Type one word to create a category")
    end
  end
end
