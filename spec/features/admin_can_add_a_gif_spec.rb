require 'rails_helper'

RSpec.feature "Admin can add gifs" do
  context "using GiphyAPI" do
    xscenario "add gif with an image_path" do
      admin = User.create(first_name: "Edilene", last_name: "Boss", username: "bossy", email: "bossyboss@email.com", password: "password", password_confirmation: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path
      save_and_open_page
      click_on("Add a gif")

      expect(page).to have_content()
    end
  end
end
