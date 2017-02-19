require 'rails_helper'

RSpec.feature "User can mark gifs as favorites" do
  xscenario "User selects favorites" do
    user = create(:user)
    gif = create(:gif)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on("Create a gallery of gifs")
    # save_and_open_page
    check("#{gif.title}")
    click_on "Favorite"

    expect(page).to have_content("Jane's favorite gifs")
  end
end
