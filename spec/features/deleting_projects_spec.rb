require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  scenario "with valid attributes", js: true do
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
