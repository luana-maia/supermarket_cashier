class PricingRule
  attr_reader :product_code

  def initialize(product_code)
    @product_code = product_code
  end

  def apply(items)
    raise NotImplementedError, "Subclasses must implement apply method"
  end
end
