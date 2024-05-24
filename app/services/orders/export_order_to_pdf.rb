module Orders
  class ExportOrderToPdf
    require 'prawn/table'

    def initialize(order)
      @order = order
    end

    def generate
      Prawn::Document.new do |pdf|
        pdf.text("Order Details", size: 30, style: :bold)
        pdf.move_down(20)

        pdf.text("Order ID: #{@order.id}", size: 15)
        pdf.text("Total Price: #{@order.total_price}", size: 15)
        pdf.text("Completed At: #{@order.updated_at.strftime('%Y-%m-%d')}", size: 15) if @order.completed?

        pdf.move_down(20)

        pdf.table(order_items_table) do
          row(0).font_style = :bold
          columns(1..3).align = :right
          self.header = true
        end

        pdf.move_down(20)
        pdf.text("Thank you for your order!", size: 15, style: :bold)
      end.render
    end

    private

    def order_items_table
      [['Name', 'Price', 'Quantity', 'Total']] +
        @order.order_items.map do |item|
          [item.product.name, item.unit_price, item.quantity, item.total_price]
        end
    end
  end
end
