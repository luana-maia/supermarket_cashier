# Supermarket Cashier

Checkout system in Ruby with **flexible pricing rules**.  
Includes rules such as:
- **BOGO (Buy One Get One Free)** for green tea  
- **Bulk discount** for strawberries  
- **Special discount** for coffee  

Built following **TDD (Test-Driven Development)** using **RSpec**.

---

## 🚀 How to run the project

### 1. Clone the repository
```bash
git clone https://github.com/your-username/supermarket_cashier.git
cd supermarket_cashier
```

### 2. Install dependencies
```bash
bundle install
```
### 3. Run the tests
```bash
rspec
```
## 📌 Example usage (via Ruby code)
```bash
require_relative 'lib/product'
require_relative 'lib/checkout'
require_relative 'lib/pricing_rules/bogo'
require_relative 'lib/pricing_rules/bulk_discount'
require_relative 'lib/pricing_rules/coffee_discount'

green_tea = Product.new('GR1', 'Green tea', 3.11)
strawberries = Product.new('SR1', 'Strawberries', 5.0)
coffee = Product.new('CF1', 'Coffee', 11.23)

rules = [
  Bogo.new('GR1'),
  BulkDiscount.new('SR1', 3, 4.50),
  CoffeeDiscount.new('CF1', 3)
]

co = Checkout.new(rules)

co.scan(green_tea)
co.scan(strawberries)
co.scan(coffee)

puts co.total
```
## 🛒 Interactive Checkout:

You can also test the checkout interactively with different products and quantities using:
```bash
ruby interactive_checkout.rb
```
**Instructions:**
- The system will show all available products and prices.
- Enter the product code and quantity separated by a space (e.g., GR1 2).
- Repeat for each product you want to add.
- Type 'done' when finished.
- The system will display all scanned products and the total amount applying all pricing rules (BOGO, Bulk Discount, Coffee Discount).

Example interaction:
```bash
Enter product code and quantity (e.g., GR1 2) or 'done': GR1 2
2 x Green tea added to cart.
Enter product code and quantity (e.g., GR1 2) or 'done': SR1 3
3 x Strawberries added to cart.
Enter product code and quantity (e.g., GR1 2) or 'done': CF1 3
3 x Coffee added to cart.
Enter product code and quantity (e.g., GR1 2) or 'done': done

Scanned products:
Green tea (£3.11)
Green tea (£3.11)
Strawberries (£5.0)
Strawberries (£5.0)
Strawberries (£5.0)
Coffee (£11.23)
Coffee (£11.23)
Coffee (£11.23)

Total to pay: £XX.XX
```

## ✅ Project structure
```bash
supermarket_cashier/
├── lib/
│   ├── product.rb
│   ├── checkout.rb
│   └── pricing_rules/
│       ├── pricing_rule.rb
│       ├── bogo.rb
│       ├── bulk_discount.rb
│       └── coffee_discount.rb
├── spec/
│   ├── product_spec.rb
│   ├── checkout_spec.rb
│   └── pricing_rules_spec.rb
├── Gemfile
├── .gitignore
├── README.md
└── interactive_checkout.rb
```
## 💻 Technologies used
- Ruby
- RSpec (for TDD)

## 📄 License
This project is for technical evaluation purposes only.
