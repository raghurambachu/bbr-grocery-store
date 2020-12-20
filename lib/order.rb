class Order
    def initialize(customer)
        @customer = customer
    end

    def sorted_items
        @customer.valid_items.sort { |order1,order2|  order1.qty != order2.qty ? 0 : order1.item_name <=> order2.item_name}
    end

    def total_price
        @customer.valid_items.reduce(0){ |order_total,order_item| order_total + order_item.order_amount   }
    end

    def amount_saved
        @customer.valid_items.reduce(0) { |amount_saved,order_item| amount_saved + (order_item.qty * order_item.unit_price - order_item.order_amount)  }.round(2)
    end

    def products_not_available
        @customer.invalid.map(&:capitalize).join(", ")
    end

    def generate_bill
        puts
        puts "Item Name          Quantity           Price"
        puts "-------------------------------------------------"
        sorted_items.map do |order_item| 
            print "#{order_item.item_name.capitalize.ljust(22," ")}" 
            print "#{order_item.qty.to_s.ljust(18," ")}"
            print "\$#{order_item.order_amount}"
            puts
        end
        puts
        puts "Total price : \$#{total_price}"
        puts "Today, you saved \$#{amount_saved}"
        puts "#{products_not_available} currently are not available" if !@customer.invalid.empty?
    end
end