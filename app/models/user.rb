class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates             :username, :email, uniqueness: true 
  validates             :username, length: { minumum: 3, maximum: 30 }
  validates_format_of   :email, :with => /\w+@\w+\.\w+/i

  has_many :products
  has_many :orders

  has_secure_password

  def self.vendors
    User.all.reject do |user|
      user.products.empty?
    end
  end

  def sales
    OrderItem.joins(:product).where("products.user_id = ?", id)
  end

  def sales_by_status(status)
    OrderItem.joins(:product).joins(:order).where("products.user_id = ? AND orders.status = LOWER(?)", id, status.downcase)
  end

  def sales_but_not_pending
    OrderItem.joins(:product).joins(:order).where("products.user_id = ? AND orders.status != LOWER(?)", id, "pending")
  end
end