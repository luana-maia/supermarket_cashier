require_relative 'lib/product'
require_relative 'lib/checkout'
require_relative 'lib/pricing_rules/bogo'
require_relative 'lib/pricing_rules/bulk_discount'
require_relative 'lib/pricing_rules/coffee_discount'

# Available products
products = {
  'GR1' => Product.new('GR1', 'Green tea', 3.11),
  'SR1' => Product.new('SR1', 'Strawberries', 5.0),
  'CF1' => Product.new('CF1', 'Coffee', 11.23)
}

# Pricing rules
rules = [
  Bogo.new('GR1'),
  BulkDiscount.new('SR1', 3, 4.50),
  CoffeeDiscount.new('CF1', 3)
]

checkout = Checkout.new(rules)

puts "Welcome to the Advanced Supermarket Checkout!"
puts "Available products:"
products.each { |code, product| puts "#{code} - #{product.name} (£#{product.price})" }
puts "\nType 'done' when you finish adding products.\n\n"

loop do
  print "Enter product code and quantity (e.g., GR1 2) or 'done': "
  input = gets.chomp.upcase
  break if input == 'DONE'

  code, qty = input.split
  qty = qty.to_i

  if products.key?(code) && qty > 0
    qty.times { checkout.scan(products[code]) }
    puts "#{qty} x #{products[code].name} added to cart."
  else
    puts "Invalid input. Please enter a valid code and quantity."
  end
end

puts "\nScanned products:"
checkout_items = checkout.instance_variable_get(:@items)
checkout_items.each { |item| puts "#{item.name} (£#{item.price})" }

puts "\nTotal to pay: £#{checkout.total}"
puts "Thank you for shopping with us!"