require_relative 'pricing_rule'

class Bogo < PricingRule
  def apply(items)
    eligible_items = items.select { |item| item.code == product_code }
    free_items = eligible_items.count / 2
    free_items * (eligible_items.first&.price || 0)
  end
end
