class ReviewsController < ApplicationController
  
  def create
  	@product = Product.find(params[:product_id])
  	@review = @product.reviews.create(params[:reviews])

  	
  	redirect_to product_path(@product)
  end

  
  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :author, :rating, :content)
  end
end
