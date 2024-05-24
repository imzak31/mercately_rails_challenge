class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :total_quantity

  def total_quantity
    object.order_items.sum(:quantity)
  end
end
