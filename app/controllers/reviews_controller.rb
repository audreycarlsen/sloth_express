class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :author, :rating, :content)
  end
end
