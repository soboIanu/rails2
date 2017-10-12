require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "handles a missing post correctly" do
    get :show, params: { id: "not-here" }

    expect(response).to redirect_to(posts_path)

    message = "Le post que vous cherchez n'a pas pu être trouvé"
    expect(flash[:alert]).to eq message
  end
end
