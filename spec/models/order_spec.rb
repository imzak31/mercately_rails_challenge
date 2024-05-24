# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with valid attributes" do
    expect(build(:order)).to be_valid
  end

  it "transitions to completed state" do
    order = create(:order, :cart)
    order.complete!
    expect(order.state).to eq('completed')
  end
end
