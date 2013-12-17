class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presense :true
  validates :quantity, presence :true, numericality: {:greater_than => 0}
end
