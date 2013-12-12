class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {:greater_than => 0}
  # validates :user_id, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
  belongs_to :user
end
