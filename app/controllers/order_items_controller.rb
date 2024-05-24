class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    if @order_item.save
      cart_count = @order.order_items.sum(:quantity)
      render json: { order_item: OrderItemSerializer.new(@order_item), cart_count: }, status: :created
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
      redirect_to(orders_path, notice: 'Item was successfully removed.')
    else
      redirect_to(orders_path, alert: 'Failed to remove item.')
    end
  end

  private

  def set_order
    @order = current_user.orders.find_by(state: 'cart') || current_user.orders.create(state: 'cart')
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :unit_price)
  end
end
