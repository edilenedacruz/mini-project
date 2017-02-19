require 'rails_helper'

RSpec.feature "Admin users can be discerned from regular users" do
  context "An user can be an admin" do
    xscenario "has a 'role' of admin" do
    admin = User.create(first_name: "Edilene", last_name: "Boss", username: "bossy", email: "bossyboss@email.com", password: "password", password_confirmation: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_gifs_path
    expect(page).to have_content("Add a gif")
    end
  end

  scenario "A regular user gets a 404 page when trying to add a gif" do
    user = User.create(first_name: "Edilene", last_name: "Storm", username: "perfectstorm", email: "perfectstorm@email.com", password: "password", password_confirmation: "password", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_gifs_path

    expect(page).to have_content "404"
  end
end
