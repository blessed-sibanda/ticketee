require "rails_helper"

RSpec.feature "Viewing projects" do
  scenario "successfully" do
    project = FactoryBot.create(:project, name: "Visual Studio Code")

    visit "/"

    click_link "Visual Studio Code"

    expect(page.current_url).to eq project_url(project)
  end
end
