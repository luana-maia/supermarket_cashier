# Handles scanning products and calculating total price
# Applies pricing rules dynamically
class Checkout
  def initialize(pricing_rules = [])
    @pricing_rules = pricing_rules
    @items = []
  end

  # Adds a product to the cart
  def scan(product)
    @items << product
  end

  # Calculates total price applying all pricing rules
  def total
    subtotal = @items.sum(&:price)
    total_discount = @pricing_rules.sum { |rule| rule.apply(@items) }
    (subtotal - total_discount).round(2)
    return { total: (subtotal - total_discount).round(2), discount: total_discount.round(2) }
  end

  def items
    @items
  end
end
