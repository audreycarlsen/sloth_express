class OrdersController < ApplicationController

  def show
  end

  # def index
  # end

  def edit
  end

  def create
    #fill this with checkout

    @order = Order.new(order_params)
    #Not needed
    @products = Product.all.collect { |p| [p.name, p.id]}

    #No
    params[:order][:products].each do |product_id|
      next if product_id.to_i == 0 
      @order.products << Product.find(product_id.to_i)
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to 'orders/show', notice: 'Item was added to your cart'}
      else
        format.html { render @products_path }
      end
    end
  end

  def update
  end

  def add_to_cart
    unless session[:order_id]
      @order = Order.new(order_params)
    end
      @order_item = OrderItem.new(order_id: session[:order_id], product_id: params[:product_id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end


end
