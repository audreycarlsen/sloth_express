class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: {:greater_than => 0}
  validates :order_id, presence: true
  validates :product_id, presence: true

  def subtotal
    product.price*quantity
  end

  def self.total
    self.sum {|order_item| order_item.subtotal}
  end
end