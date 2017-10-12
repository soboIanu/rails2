require "rails_helper"

RSpec.feature "Users can delete posts" do
  scenario "successfully" do
    FactoryGirl.create(:post, name: "Sandrine", description: "Avocate", content: "Boxeuse")

    visit "/"
    click_link "Sandrine"
    click_link "Supprimer le Post"

    expect(page).to have_content "Post supprimé"
    expect(page.current_url).to eq posts_url
    expect(page).to have_no_content "Sandrine"
  end
end
