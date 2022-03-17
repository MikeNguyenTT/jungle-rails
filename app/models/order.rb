class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :calculate_product_quantity_left

  private
  def calculate_product_quantity_left
    line_items.each do |item| 
      item.product.quantity -= item.quantity
      item.product.save!
    end
  end
end
