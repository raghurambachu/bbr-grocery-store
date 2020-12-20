class Product 
    attr_reader :prod_name,:unit_price,:sale_qty, :sale_price
    # Assuming store puts either both sale_qty & sale_price else does'nt put both of them
    def initialize(prod_name,unit_price,sale_qty = nil,sale_price = nil )
        @prod_name = prod_name
        @unit_price = unit_price
        @sale_qty = sale_qty
        @sale_price = sale_price
    end
    
    def is_on_sale?
        !(@sale_qty.nil?  && @sale_price.nil?)
    end


end