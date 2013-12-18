class Order < ActiveRecord::Base
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :user

  # validate :order_item_quantity_cannot_be_greater_than_product_stock
  
  # def order_item_quantity_cannot_be_greater_than_product_stock
  #   if order_item.quantity > product.stock
  #     errors.add(:quantity, "can't be greater than number in stock")
  #   end
  # end
end
