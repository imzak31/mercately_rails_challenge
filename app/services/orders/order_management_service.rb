module Orders
  class OrderManagementService
    def initialize(user)
      @user = user
    end

    def current_order
      @user.orders.find_or_create_by(state: 'cart')
    end

    def complete_order(order)
      order.complete!
    end
  end
end
