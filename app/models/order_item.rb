class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  # validates :quantity, presense :true
  # validates :quantity, presence :true, numericality: {:greater_than => 0}
  validate :order_item_quantity_cannot_be_greater_than_product_stock

  def order_item_quantity_cannot_be_greater_than_product_stock
    if quantity > product.stock
      errors.add(:quantity, "can't be greater than number in stock")
    end
  end
end
