class Order < ActiveRecord::Base
    has_many :products, through: :order_item
end
