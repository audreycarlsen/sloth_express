class OrderItemsController < ApplicationController

  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new(order_item_params)
  end
  

  def create
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
    add_item_to_cart
  end

  def add_item_to_cart
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find_by(product_id: @product.id, order_id: session[:order_id])
    if @order_item
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new 
      @order_item.product = @product
      @order_item.order = @order
    end

    if @order_item.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def remove_item
    @order_item = OrderItem.find_by(order_id: current_order.id, product_id: params[:product_id])
    @order_item.destroy
    redirect_to order_path(current_order)
  end


private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :user_id)
  end
  
  def order_item_params
     params.require(:order_item).permit(:product_id, :order_id, :quantity )
  end
end
