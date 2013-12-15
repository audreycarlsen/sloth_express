class Review < ActiveRecord::Base
  belongs_to :product

  def self.create_review
  	@product = Product.find(params[:product_id])

  	@review = @product.reviews.create(review_params)
  end
end
