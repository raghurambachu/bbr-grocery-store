require_relative("grocery_store")
require_relative("product")
require_relative("customer")

grocery_store = GroceryStore.new("Big Bazaar")

product1 = Product.new("milk",3.97,2,5)
product2 = Product.new("bread",2.17,3,6)
product3 = Product.new("banana",0.99)
product4 = Product.new("apple",0.89)


grocery_store.add_product(product1)
grocery_store.add_product(product2)
grocery_store.add_product(product3)
grocery_store.add_product(product4)

GroceryStore.pricetable(grocery_store)
puts 





# is an Hash containing order details ie order_item => count
customer_order = GroceryStore.take_customer_input

print customer_order





