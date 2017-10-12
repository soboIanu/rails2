require "rails_helper"

RSpec.feature "Users can create new posts" do
  before do
    visit "/"
    click_link "Nouveau Post"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sandrine"
    fill_in "Description", with: "Avocate"
    fill_in "Content", with: "Boxeuse"
    click_button "Poster"

    expect(page).to have_content "Post effectué"
  end
end
