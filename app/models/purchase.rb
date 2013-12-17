class Purchase < ActiveRecord::Base
  validates :email, presence: true, format: {with: /\w+@\w+\.\w+/i}
  validates :address, presence: true
  validates :name, presence: true
  validates :cc_number, presence: true, numericality: true, length: { is: 16 }
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :cvv, presence: true, numericality: true, length: { is: 3 }
  validates :zipcode, presence: true, numericality: true, length: { is: 5 }

end
