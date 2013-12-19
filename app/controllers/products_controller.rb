class ProductsController < ApplicationController
  before_action :set_product, only:[:show, :edit, :update, :destroy]
  before_action :check_login, only:[:new, :edit, :create, :update, :destroy]

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

  def admin_view
    @products = Product.all
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
    #   redirect_to product_path(@product), :notice => 'Product was successfully created.'
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
        categories_list
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

  def search
    thing_were_searching_for = params[:search]
    @products = Product.search(thing_were_searching_for)
    if @products.empty?  
      redirect_to products_path, notice: "Sorry, Sloth Cadet, no items matching #{thing_were_searching_for}."      
    else
      flash[:notice] = "Here are all the fine products matching #{thing_were_searching_for}!"
      render :index
    end
  end

  def retire_product
    set_product
    @product.update(item_status: "retired")
    redirect_to product_path(@product), notice: "Product succesfully retired!"
  end

  def activate_product
    set_product
    @product.update(item_status: "active")
    redirect_to product_path(@product), notice: "Product succesfully activated!"
  end

  private
  def check_login
    if session[:user_id].nil?
      redirect_to new_session_path, :notice => "Please log in or create an account."
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :reviews, :price, :photo, :stock, :user_id, :item_status => "active", :categories => {})
  end
end
