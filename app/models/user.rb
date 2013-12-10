class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates :username, :email, uniqueness: true
  validates_format_of :email, :with => /\w+@\w+\.\w+/i
  validates_confirmation_of :password

  has_many :products

  has_secure_password

end
