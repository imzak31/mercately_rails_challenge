FactoryBot.define do
  factory :order_item do
    association :order
    association :product
    quantity { 1 }

    after(:build) do |order_item|
      order_item.unit_price = order_item.product.price
    end
  end
end
