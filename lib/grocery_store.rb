class GroceryStore
    attr_reader :products,:title
    def initialize(title)
        @title = title
        @products ||= Hash.new
    end

    def add_product(product)
        products[product.prod_name] = product if product
    end

    def self.pricetable(store)
        # printout the table depicting the unit price and sale price using each iterator
        puts "Welcome to #{store.title}"
        puts "Item Name          Unit price          Sale price"
        puts "-------------------------------------------------"

        store.products.each { |prod_name,product|
            unit_price = product.unit_price
            print "#{prod_name.ljust(22," ")}\$#{unit_price.to_s.ljust(16," ")}" 
            print "#{product.sale_qty} for \$#{product.sale_price}" if product.is_on_sale?
            puts
        }
    end

    def self.take_customer_input
        puts "Please enter all the items purchased separated by a comma"
        customer_order_input = gets.chomp

        customer_order = nil
        if customer_order_input.nil? || customer_order_input.strip.empty?
            puts "Please Enter the valid input!!!"
            exit(false)
        else
            customer_order_list = customer_order_input.downcase.strip.split(",").map(&:strip).reject { |item|  item == "" }
            customer_order = customer_order_list.reduce(Hash.new(0)) { |order,item| order[item] = (order[item] || 0) + 1; order }
        end
        customer_order
    end
end