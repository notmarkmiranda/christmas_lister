require "rails_helper"

describe PagesController do
  it "#GET show" do
    get :show
    expect(response).to render_template :show
  end
end
