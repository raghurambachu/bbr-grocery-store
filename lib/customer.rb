require_relative("order_item")

class Customer
    attr_reader :valid_items,:invalid
    def initialize(customer_order,store)
        # order_items contains all the valid items
        @store = store
        @customer_order = customer_order
        @valid_items = []
        @invalid = []
    end


  
    def generate_item
        @customer_order.each do |item,quantity|
            if !@store.products[item].nil?
                product = @store.products[item]
                if product.is_on_sale?
                    valid_items << OrderItemSale.new(item,quantity,product.unit_price,product.sale_price,product.sale_qty)
                else
                    valid_items << OrderItem.new(item,quantity,product.unit_price)
                end
            else
                invalid << item
            end
        end
        # return [valid_items,invalid]
    end
end
