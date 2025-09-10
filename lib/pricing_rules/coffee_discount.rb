require_relative 'pricing_rule'

class CoffeeDiscount < PricingRule
  def initialize(product_code, min_quantity)
    super(product_code)
    @min_quantity = min_quantity
  end

  def apply(items)
    eligible_items = items.select { |item| item.code == product_code }
    if eligible_items.count >= @min_quantity
      original_total = eligible_items.sum(&:price)
      discounted_total = eligible_items.count * eligible_items.first.price * 2.0 / 3
      original_total - discounted_total
    else
      0
    end
  end
end
