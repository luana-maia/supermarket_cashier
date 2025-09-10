class Checkout
  def initialize(pricing_rules = [])
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(product)
    @items << product
  end

  def total
    subtotal = @items.sum(&:price)
    total_discount = @pricing_rules.sum { |rule| rule.apply(@items) }
    (subtotal - total_discount).round(2)
  end
end
