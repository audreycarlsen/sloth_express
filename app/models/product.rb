class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {:greater_than => 0}
  # validates :user_id, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
<<<<<<< HEAD
  has_many :reviews
=======
  belongs_to :user
>>>>>>> f8382f046d80fad663d759f11f946dfa1a0e0a75
end
