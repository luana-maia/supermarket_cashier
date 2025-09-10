require 'rspec'
require_relative '../lib/checkout'
require_relative '../lib/product'
require_relative '../lib/pricing_rules/bogo'
require_relative '../lib/pricing_rules/bulk_discount'
require_relative '../lib/pricing_rules/coffee_discount'

RSpec.describe Checkout do
  let(:green_tea) { Product.new('GR1', 'Green tea', 3.11) }
  let(:strawberries) { Product.new('SR1', 'Strawberries', 5.0) }
  let(:coffee) { Product.new('CF1', 'Coffee', 11.23) }

  let(:rules) do
    [
      Bogo.new('GR1'),
      BulkDiscount.new('SR1', 3, 4.50),
      CoffeeDiscount.new('CF1', 3)
    ]
  end

  let(:checkout) { Checkout.new(rules) }

  it 'calculates total without discounts' do
    checkout.scan(green_tea)
    checkout.scan(strawberries)
    expect(checkout.total).to eq(8.11)
  end

  it 'applies BOGO for green tea' do
    2.times { checkout.scan(green_tea) }
    expect(checkout.total).to eq(3.11)
  end

  it 'applies bulk discount for strawberries' do
    3.times { checkout.scan(strawberries) }
    expect(checkout.total).to eq(13.50)
  end

  it 'applies coffee discount for 3 or more coffees' do
    3.times { checkout.scan(coffee) }
    expect(checkout.total).to eq((11.23 * 2).round(2))
  end

  it 'applies multiple rules together' do
    2.times { checkout.scan(green_tea) }
    3.times { checkout.scan(strawberries) }
    3.times { checkout.scan(coffee) }
    expect(checkout.total).to eq((3.11 + 13.50 + (11.23 * 2)).round(2))
  end
end
