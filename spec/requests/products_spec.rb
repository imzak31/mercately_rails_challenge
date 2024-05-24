require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get products_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get products_path
      expect(response).to render_template(:index)
    end
  end

  describe "POST /create" do
    it "creates a new product" do
      expect {
        post products_path, params: { product: { name: "New Product", price: 10.99 } }
      }.to change(Product, :count).by(1)
    end

    it "redirects to the products index" do
      post products_path, params: { product: { name: "New Product", price: 10.99 } }
      expect(response).to redirect_to(products_path)
    end
  end
end
