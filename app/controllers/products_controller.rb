class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end


    # if @product.save
    #   redirect_to product_path(@product)
    # else
    #   render :new
    # end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :stock)
  end
end
