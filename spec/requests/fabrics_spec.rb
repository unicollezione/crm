require 'rails_helper'

RSpec.describe "Fabrics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/fabrics/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/fabrics/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/fabrics/create"
      expect(response).to have_http_status(:success)
    end
  end

end
