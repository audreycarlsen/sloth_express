class Review < ActiveRecord::Base
  belongs_to :product

   validates :title, presence: true
end
