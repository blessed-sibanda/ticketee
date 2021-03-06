require "rails_helper"

RSpec.feature 'Admins can change a user\'s details' do
  let(:admin) { create :user, :admin }
  let(:user) { create :user }

  before do
    login_as admin
    visit admin_user_path(user)
    click_link "Edit User"
  end

  scenario "with valid details" do
    fill_in "Email", with: "newguy@example.com"
    click_button "Update User"

    expect(page).to have_content "User has been updated."
    expect(page).to have_content "newguy@example.com"
    expect(page).not_to have_content user.email
  end

  scenario "when toggling a user's admin status" do
    check "Is an admin?"
    click_button "Update User"

    expect(page).to have_content "User has been updated."
    expect(page).to have_content "#{user.email} (Admin)"
  end
end
