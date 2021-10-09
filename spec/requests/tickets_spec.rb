require "rails_helper"

RSpec.describe "Tickets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      project = FactoryBot.create(:project)
      get new_project_ticket_path(project)
      expect(response).to have_http_status(:success)
    end
  end
end
