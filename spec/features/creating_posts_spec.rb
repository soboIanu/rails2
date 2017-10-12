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

    post = Post.find_by(name: "Sandrine")
    expect(page.current_url).to eq post_url(post)

    title = "Sandrine - Posts - Admin"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Poster"

    expect(page).to have_content "Post non effectué"
    expect(page).to have_content "Name can't be blank"
  end

end
