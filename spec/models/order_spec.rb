require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create!(name: "Motobike")
      @product1 = @category.products.create!(name: "10 inch wheel", description: "Wheel for very small motorbike", quantity: 5, price_cents: 2000)
      @product2 = @category.products.create!(name: "Shirt", description: "Men shirt", quantity: 10, price_cents: 10000, category_id: 3)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      @order = Order.new(total_cents: 30000, stripe_charge_id: 1, email: "abc@abc.com")
      @order.line_items.new(product_id: @product1.id, quantity: 2, item_price_cents: @product1.price_cents, total_price_cents: @product1.price_cents * 2)
      @order.save!

      @product1.reload
      expect(@product1.quantity).to eq(3)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(total_cents: 30000, stripe_charge_id: 1, email: "abc@abc.com")
      @order.line_items.new(product_id: @product1.id, quantity: 3, item_price_cents: @product1.price_cents, total_price_cents: @product1.price_cents * 3)
      @order.save!

      @product2.reload
      expect(@product2.quantity).to eq(10)
    end
  end
end
