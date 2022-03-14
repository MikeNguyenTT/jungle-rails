require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    it 'should have all fields presence and id auto-assigned' do
      @category = Category.new(name: "Motobike")
      @product = @category.products.new(name: "10 inch wheel", description: "Wheel for very small motorbike", quantity: 4, price_cents: 2000)

      @category.save!
      @product.save!

      expect(@product.id).to be_present
      expect(@product.name).to be_present
      expect(@product.description).to be_present
      expect(@product.quantity).to be_present
      expect(@product.price_cents).to be_present
      expect(@product.category).to be_present
    end

    it 'should have error when product name is nil' do
      @category = Category.new(name: "Household")
      @category.save!

      @product = @category.products.new(description: "For washing hair", quantity: 2, price_cents: 500)
      @product.save

      expect(@product.errors.full_messages).to be_present
      expect(@product.errors.full_messages.length).to be >= 0
    end

    it 'should have error when product quantity is nil' do
      @category = Category.new(name: "Book")
      @category.save!

      @product = @category.products.new(name: "Grade 1 Math", description: "First math book for children", price_cents: 700)
      @product.save

      expect(@product.errors.full_messages).to be_present
      expect(@product.errors.full_messages.length).to be >= 0
    end

    it 'should have error when product price is nil' do
      @category = Category.new(name: "Footware")
      @category.save!

      @product = @category.products.new(name: "Slippers", description: "Very high end slippers", quantity: 1)
      @product.save

      expect(@product.errors.full_messages).to be_present
      expect(@product.errors.full_messages.length).to be >= 0
    end

    it 'should have error when product category is nil' do
      @product = Product.new(name: "Flexboots", description: "Men summer rain boot", quantity: 10, price_cents: 1000)
      @product.save

      expect(@product.errors.full_messages).to be_present
      expect(@product.errors.full_messages.length).to be >= 0
    end
  
  end
  
end
