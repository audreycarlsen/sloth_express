class Purchase < ActiveRecord::Base
  validates :email, presence: true, format: {with: /\w+@\w+\.\w+/i}
  validates :address, presence: true
  validates :name, presence: true
  validates :cc_number, presence: true
  validates :cc_expiration, presence: true
  validates :cvv, presence: true
  validates :zipcode, presence: true


end
