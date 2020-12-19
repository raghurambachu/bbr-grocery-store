class Customer
    def initialize(customer_order)
        # order_items contains all the valid items
        @order_items = []
        @invalid = []
    end

    def self.service
        puts "Please enter all the items purchased separated by a comma"
        customer_order_input = gets.chomp

        customer_order = nil
        if customer_order_input.nil? || customer_order_input.empty?
            puts "Please Enter the valid input!!!"
        else
            customer_order = customer_order_input.downcase.strip.split(",").map(&:strip).reject { |item|  item == "" }
        end
        customer_order
    end

    def generate_item

    end
end
