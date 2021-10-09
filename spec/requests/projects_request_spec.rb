require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "GET /projects/:id" do
    it "handles a missing project correctly" do
      get project_path("not-here")

      expect(response).to redirect_to projects_url

      message = "The project you are looking for could not be found."
      expect(flash[:alert]).to eq message
    end
  end
end
