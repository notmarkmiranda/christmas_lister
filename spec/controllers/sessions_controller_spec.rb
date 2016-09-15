require "rails_helper"

describe SessionsController do
  it "#GET :new" do
    get :new
    expect(response).to render_template :new
  end

  it "#POST :create" do
    user = User.create(email: "a@b.com", password: "password")
    post :create, params: { session: { email: user.email, password: "password" } }
    expect(response).to redirect_to dashboard_path
  end
end
