class OrderItemsController < ApplicationController

  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new
  end
  

  def create
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
    
    @order_item = OrderItem.new(order_id: current_order.id, product_id: params[:product_id], quantity: 1)

    @product = Product.find(params[:product_id])
    @order.products << @product
    redirect_to order_path(@order.id)
  end

  def remove_item
    @order_item = OrderItem.find_by(order_id: current_order.id, product_id: params[:product_id])
    @order_item.destroy
    redirect_to order_path(current_order)
  end

end

private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end
