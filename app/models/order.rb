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
  include Orders::OrderStateMachine

  belongs_to :user
  has_many :order_items, dependent: :destroy

  before_save :calculate_total_price

  def calculate_total_price
    self.total_price = order_items.to_a.sum(&:total_price)
  end

  def total_price
    read_attribute(:total_price) || calculate_total_price
  end
end
