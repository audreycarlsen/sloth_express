class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates :username, :email, uniqueness: true 
  validates :username, length: { minumum: 3, maximum: 30 }
  validates_format_of :email, :with => /\w+@\w+\.\w+/i

  has_many :products

  has_secure_password

end
