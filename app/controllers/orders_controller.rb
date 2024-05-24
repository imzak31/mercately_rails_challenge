class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :pdf, :complete, :destroy]

  def index
    @orders = current_user.orders.where(state: 'cart')
    @completed_orders = current_user.orders.where(state: 'completed')
    @removed_orders = current_user.orders.with_deleted.where(state: 'removed')
  end

  def show
    # @order is already set by the set_order before_action
  end

  def pdf
    pdf = Orders::ExportOrderToPdf.new(@order).generate
    send_data(pdf, filename: "order_#{@order.id}.pdf", type: 'application/pdf', disposition: 'inline')
  end

  def create
    order_service = Orders::OrderManagementService.new(current_user)
    @order = order_service.current_order
    if @order.update(order_params)
      order_service.complete_order(@order)
      render json: @order, status: :created, serializer: OrderSerializer
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def complete
    order_service = Orders::OrderManagementService.new(current_user)
    order_service.complete_order(@order)
    redirect_to(orders_path, notice: 'Order was successfully completed.')
  end

  def destroy
    @order.remove!
    redirect_to(orders_path, notice: 'Order was successfully removed.')
  end

  private

  def set_order
    @order = current_user.orders.with_deleted.find(params[:id])
  end

  def order_params
    params.require(:order).permit(order_items_attributes: [:product_id, :quantity, :unit_price])
  end
end
