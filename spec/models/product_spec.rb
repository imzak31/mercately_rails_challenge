# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe(Product) do
  it 'is valid with valid attributes' do
    expect(build(:product)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:product, name: nil)).not_to be_valid
  end

  it 'is not valid without a price' do
    expect(build(:product, price: nil)).not_to be_valid
  end
end
