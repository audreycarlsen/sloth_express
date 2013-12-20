class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user
  has_one :purchase

  validate :order_items, presence: true

  def cart_size
   order_items.sum(:quantity)

    # order_item_array = OrderItem.all.select { |order_item| order_item.order_id == id }
    # cart_size = 0
    # order_item_array.each do |order_item|
    #   cart_size += order_item.quantity
    # end
    # cart_size
  end

  #We blame Stand for this.
  # validate :order_item_quantity_cannot_be_greater_than_product_stock
  
  # def order_item_quantity_cannot_be_greater_than_product_stock
  #   if order_item.quantity > product.stock
  #     errors.add(:quantity, "can't be greater than number in stock")
  #   end
  # end
end
