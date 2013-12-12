class ProductsController < ApplicationController
  before_action :set_product, only:[:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    categories_list
  end

  def edit
    categories_list
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        assign_categories_to_products
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        categories_list
        format.html { render action: 'new' }
      end
    end

    # if @product.save
    #   redirect_to product_path(@product)
    # else
    #   render :new
    # end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        assign_categories_to_products
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end

# Creates an array of all categories
  def categories_list
    @categories = Category.all.collect { |p| [p.name, p.id] }
  end

  def assign_categories_to_products
    params[:product][:categories].each do |category_id|
      next if category_id.to_i == 0
      @product.categories << Category.find(category_id.to_i)
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :stock, :categories => {})
  end
end
