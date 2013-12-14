class ReviewsController < ApplicationController
  
  def create
  	Review.create_review

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
