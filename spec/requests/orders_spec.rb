require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let!(:order) { create(:order, user: user) }
  let!(:order_item) { create(:order_item, order: order, product: product) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get orders_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get orders_path
      expect(response).to render_template(:index)
    end
  end

  describe "PATCH /complete" do
    it "completes the order" do
      patch complete_order_path(order)
      expect(order.reload.state).to eq("completed")
    end

    it "redirects to the orders index" do
      patch complete_order_path(order)
      expect(response).to redirect_to(orders_path)
    end
  end

  describe "DELETE /destroy" do
    it "removes the order" do
      expect {
        delete order_path(order)
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders index" do
      delete order_path(order)
      expect(response).to redirect_to(orders_path)
    end
  end
end
