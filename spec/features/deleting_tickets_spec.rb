require "rails_helper"

RSpec.feature "Deleting tickets" do
  let(:project) { create :project }
  let(:ticket) { create :ticket, project: project }

  before { visit project_ticket_path(project, ticket) }

  scenario "successfully", js: true do
    accept_confirm do
      click_link "Delete Ticket"
    end

    expect(page).to have_content "Ticket has been deleted."
    expect(page.current_path).to eq project_path(project)
    expect(page).not_to have_content ticket.name
  end
end
