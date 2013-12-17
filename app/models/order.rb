class Order < ActiveRecord::Base
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :user
    
#    validates :order_item, :length => { :minimum => 1 }
end
