class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :total_price

  belongs_to :product

  def total_price
    object.total_price
  end
end
