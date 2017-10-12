require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:post, name: "Sandrine", description: "Avocate", content: "Boxeuse")

    visit "/"
    click_link "Sandrine"
    click_link "Editer le Post"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sandrine"
    fill_in "Description", with: "Avocate"
    fill_in "Content", with: "Boxeuse"
    click_button "Poster"

    expect(page).to have_content "Post mis à jour"
    expect(page).to have_content "Sandrine"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Poster"

    expect(page).to have_content "Post non mis à jour"
  end
end
