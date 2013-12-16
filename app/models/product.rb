class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {:greater_than => 0}
  # validates :user_id, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews
  belongs_to :user

  def self.search(query)
    Product.where(["name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%"])

  end
end
