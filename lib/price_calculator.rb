require_relative("grocery_store")
require_relative("product")
require_relative("order_item")
require_relative("customer")
require_relative("order")

store = GroceryStore.new("Big Bazaar")

product1 = Product.new("milk",3.97,2,5)
product2 = Product.new("bread",2.17,3,6)
product3 = Product.new("banana",0.99)
product4 = Product.new("apple",0.89)


store.add_product(product1)
store.add_product(product2)
store.add_product(product3)
store.add_product(product4)

GroceryStore.pricetable(store)
puts 

# is an Hash containing order details ie order_item => count
customer_order = GroceryStore.take_customer_input

customer1 = Customer.new(customer_order,store)
customer1.generate_item

order = Order.new(customer1)

order.generate_bill






