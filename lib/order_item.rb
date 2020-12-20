require_relative("order_item")

class OrderItem
    attr_reader :item_name,:qty,:unit_price
    def initialize(item_name,qty,unit_price)
        @item_name = item_name
        @qty = qty
        @unit_price = unit_price
    end

    def order_amount 
        qty * unit_price
    end
end


class OrderItemSale < OrderItem
    attr_reader :sale_price,:sale_qty
    def initialize(item_name,qty,unit_price,sale_price,sale_qty)
        super(item_name,qty,unit_price)
        @sale_price = sale_price
        @sale_qty = sale_qty
    end

    def order_amount
        # Extras are those extra on which unit price is applicable
        extras = qty % sale_qty
        # Number on which sale price is applicable
        no_which_sale_price_appl = qty / sale_qty
        extras * unit_price + no_which_sale_price_appl * sale_price
    end
end