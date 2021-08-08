require 'rails_helper'

RSpec.describe "StatusUpdates", type: :request do
  describe "GET /main" do
    it "returns http success" do
      get "/status_update/main"
      expect(response).to have_http_status(:success)
    end
  end

end
