require_relative 'pricing_rule'

class BulkDiscount < PricingRule
  def initialize(product_code, min_quantity, discounted_price)
    super(product_code)
    @min_quantity = min_quantity
    @discounted_price = discounted_price
  end

  def apply(items)
    eligible_items = items.select { |item| item.code == product_code }
    if eligible_items.count >= @min_quantity
      original_total = eligible_items.sum(&:price)
      discounted_total = eligible_items.count * @discounted_price
      original_total - discounted_total
    else
      0
    end
  end
end
