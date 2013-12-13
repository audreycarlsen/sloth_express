class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only:[:new, :edit, :create, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    products_list
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)

      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  # Creates an array of all products
  def products_list
    @products = Product.all.collect { |p| [ p.name, p.id ]}
  end

  # Creates an array of products in a category
  def category_products
    params[:category][:products].each do |product_id|
      next if product_id.to_i == 0
      @category.products << Product.find(product_id.to_i)
    end
  end

private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :products => {})
  end

  
end
