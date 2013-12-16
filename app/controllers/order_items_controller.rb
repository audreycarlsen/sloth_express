class OrderItemsController < ApplicationController

  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new
    # @order_item[:user_id] = session[:user_id]
    # @order_item[:quantity] = 1

  end
  

  def create
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create(status: "pending")
      # session[:order_id] = @order.id
      # @order[:status] = "pending"
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
  
