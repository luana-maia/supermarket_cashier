# Represents a product in the supermarket
# Each product has a unique code, a name, and a price
class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end
