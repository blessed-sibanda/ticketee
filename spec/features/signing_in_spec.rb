require "rails_helper"

RSpec.feature "Signing in" do
  scenario "with valid credentials" do
    user = create :user
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content "Signed in as #{user.email}"
  end
end
