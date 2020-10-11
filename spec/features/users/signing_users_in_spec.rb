require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @email = "john@example.com"
    @password = "password"
    @john = User.create!(email: @email, password: @password)
  end

  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @email
    fill_in "Password", with: @password
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@email}")
  end
end