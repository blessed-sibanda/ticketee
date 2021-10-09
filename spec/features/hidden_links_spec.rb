require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:user) { create :user }
  let(:project) { create :project }
  let(:admin) { create :user, :admin }

  context "anonymous user" do
    scenario "cannot see the New Project link" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      expect(page).to_not have_link "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      expect(page).to_not have_link "Delete Project"
    end
  end

  context "regular users" do
    before { login_as user }

    scenario "cannot see the New Project link" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      expect(page).to_not have_link "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      expect(page).to_not have_link "Delete Project"
    end
  end

  context "admin user" do
    before { login_as admin }

    scenario "can see the New Project link" do
      visit "/"
      expect(page).to have_link "New Project"
    end

    scenario "can see the Edit Project link" do
      visit project_path(project)
      expect(page).to have_link "Edit Project"
    end

    scenario "can see the Delete Project link" do
      visit project_path(project)
      expect(page).to have_link "Delete Project"
    end
  end
end
