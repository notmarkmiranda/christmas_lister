require "rails_helper"

describe "registered user can log in" do
  before do
    @user = User.create(email: "mark@example.com", password: "password")
  end

  it "user can log in with correct information" do
    visit "/"
    click_link "Get Logged In!"

    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: "password"
    click_button "Let's Go!"

    expect(page).to have_content("You're logged in!")
  end

  it "user cannot log in with incorrect information" do
    visit "/"
    click_link "Get Logged In!"

    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: "passwords"
    click_button "Let's Go!"

    expect(page).to have_content("Something went wrong.")

  end
end
