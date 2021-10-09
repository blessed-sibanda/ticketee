require "rails_helper"

RSpec.feature "Deleting projects" do
  let(:user) { create :user, :admin }

  before { login_as user }

  scenario "successfully", js: true do
    FactoryBot.create(:project, name: "Visual Studio Code")
    visit "/"
    click_link "Visual Studio Code"

    accept_confirm do
      click_link "Delete Project"
    end

    expect(page).to have_content "Project has been deleted."
    expect(page.current_path).to eq projects_path
    expect(page).not_to have_content "Visual Studio Code"
  end
end
