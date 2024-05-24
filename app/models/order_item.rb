# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  product_id :bigint           not null
#  quantity   :integer
#  unit_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderItem < ApplicationRecord
  acts_as_paranoid

  belongs_to :order
  belongs_to :product

  def total_price
    quantity * unit_price
  end
end
