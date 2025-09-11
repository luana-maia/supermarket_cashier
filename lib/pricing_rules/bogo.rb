require_relative 'pricing_rule'
# Buy-One-Get-One-Free rule
# Each second item of the same product is free
class Bogo < PricingRule
  def apply(items)
    # Filter eligible items for this product
    eligible_items = items.select { |item| item.code == product_code }
    # Calculate number of free items
    free_items = eligible_items.count / 2
    # Total discount = price of free items
    free_items * (eligible_items.first&.price || 0)
  end
end
