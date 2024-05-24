# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  state       :string           default("cart")
#
class Order < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :order_items, dependent: :destroy

  include Orders::OrderStateMachine

  def total_price
    order_items.to_a.sum(&:total_price)
  end
end
