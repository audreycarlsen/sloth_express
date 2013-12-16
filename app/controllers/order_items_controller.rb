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
    

    @product = Product.find(params[:product_id])
    @order.products << @product
    redirect_to order_path(@order.id)
  end

end

private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end
