class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, :presence :true, numericality: {:greater_than => 0}
  validates :order_id, :presence :true
  validates :product_id, :presence :true
end