require "rails_helper"

RSpec.feature "Signing out" do
  let!(:user) { create :user }

  before { login_as user }

  scenario do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
