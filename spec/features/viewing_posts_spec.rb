require "rails_helper"

RSpec.feature "Users can view posts" do
  scenario "with the post details" do
    post = FactoryGirl.create(:post, name: "Sandrine", description: "Avocate", content: "Boxeuse")

    visit "/"
    click_link "Sandrine"
    expect(page.current_url).to eq post_url(post)
  end
end
