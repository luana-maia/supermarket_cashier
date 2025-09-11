# Abstract base class for all pricing rules
# Ensures all rules implement the `apply` method
class PricingRule
  attr_reader :product_code

  def initialize(product_code)
    @product_code = product_code
  end

  def apply(items)
    raise NotImplementedError, "Subclasses must implement apply method"
  end
end
