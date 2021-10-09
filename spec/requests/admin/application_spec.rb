require "rails_helper"

RSpec.describe "/admin", type: :request do
  describe "GET /" do
    let(:user) { create :user }
    let(:admin) { create :user, :admin }

    context "when signed in as a user" do
      before { login_as user }

      it "redirects away" do
        get "/admin"
        expect(response).to have_http_status(302)
      end
    end

    context "when signed in as an admin" do
      before { login_as admin }

      it "lets the admin in" do
        get "/admin"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
